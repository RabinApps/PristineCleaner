import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pristine_cleaner/gen/strings.g.dart';

import '../core/models/scan_result.dart';
import '../services/my_tools_service.dart';
import '../services/trash_service.dart';
import '../core/settings/settings_provider.dart';
import '../core/theme/section_themes.dart';
import '../shared/removal/removal_flow.dart';
import '../shared/widgets/removal_screen.dart';
import '../shared/widgets/scan_results_view.dart';
import '../core/models/my_tool.dart';
import '../providers/my_tools_provider.dart';
import '../shared/widgets/my_tool_card.dart';

class MyToolsScreen extends ConsumerStatefulWidget {
  const MyToolsScreen({super.key});

  @override
  ConsumerState<MyToolsScreen> createState() => _MyToolsScreenState();
}

class _MyToolsScreenState extends ConsumerState<MyToolsScreen> {
  late final TextEditingController _searchCtrl;

  @override
  void initState() {
    super.initState();
    _searchCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myToolsProvider.select((state) => state.lastNotice), (
      previous,
      next,
    ) {
      if (!mounted || next == null || next == previous) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(next),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      ref.read(myToolsProvider.notifier).clearNotice();
    });

    final state = ref.watch(myToolsProvider);
    final notifier = ref.read(myToolsProvider.notifier);
    final theme = SectionThemes.myToolsLocalized(context);

    final activeTool = _findActiveTool(state);
    final activeResult = state.activeDetailResult;
    if (activeTool != null && activeResult != null) {
      return _ToolDetailView(
        tool: activeTool,
        result: activeResult,
        isCleaning: state.isCleaningDetail,
        onBack: notifier.closeDetail,
        onToggleItem: notifier.toggleActiveDetailItem,
        onSelectAll: notifier.selectAllActiveDetail,
        onDeselectAll: notifier.deselectAllActiveDetail,
        onClean: () {
          unawaited(
            _handleDetailClean(
              context: context,
              tool: activeTool,
              result: activeResult,
              notifier: notifier,
            ),
          );
        },
        onRescan: notifier.rescanActiveDetail,
      );
    }

    if (_searchCtrl.text != state.query) {
      _searchCtrl.value = TextEditingValue(
        text: state.query,
        selection: TextSelection.collapsed(offset: state.query.length),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
          stops: const [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: [
          const _AtmosphereLayer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 26, 16),
              child: Column(
                children: [
                  _Header(
                    controller: _searchCtrl,
                    onQueryChanged: notifier.setQuery,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final columns = (constraints.maxWidth / 250)
                            .floor()
                            .clamp(2, 4);
                        final ratio = columns >= 3 ? 1.23 : 1.13;

                        return GridView.builder(
                          itemCount: state.filteredTools.length,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: ratio,
                              ),
                          itemBuilder: (context, index) {
                            final tool = state.filteredTools[index];
                            final supportsDirectory = _supportsDirectoryPicker(
                              tool,
                            );
                            return MyToolCard(
                              tool: tool,
                              isRunning: state.runningToolIds.contains(tool.id),
                              summary: state.summaries[tool.id],
                              selectedDirectory: supportsDirectory
                                  ? notifier.directoryForTool(tool)
                                  : null,
                              onPickDirectory: supportsDirectory
                                  ? () async {
                                      final picked = await _pickDirectory(
                                        initialDirectory: notifier
                                            .directoryForTool(tool),
                                      );
                                      if (picked != null && picked.isNotEmpty) {
                                        notifier.setToolDirectory(
                                          tool.id,
                                          picked,
                                        );
                                      }
                                    }
                                  : null,
                              onScan: () => notifier.runTool(tool),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleDetailClean({
    required BuildContext context,
    required MyTool tool,
    required ScanResult result,
    required MyToolsNotifier notifier,
  }) async {
    final selected = result.selectedItems;
    if (selected.isEmpty) {
      notifier.clearNotice();
      return;
    }

    if (tool.scanType == MyToolScanType.timeMachineSnapshots) {
      final service = ref.read(myToolsServiceProvider);
      final outcome = await showRemovalScreen(
        context: context,
        title: tool.title,
        accentColor: tool.accentColor,
        selectedItems: selected,
        runRemoval: (token, onProgress) {
          return service.deleteTimeMachineSnapshotsTracked(
            selected,
            cancellationToken: token,
            onProgress: onProgress,
          );
        },
      );
      if (outcome == null) return;
      notifier.applyActiveDetailRemovalOutcome(outcome: outcome);
      return;
    }

    final outcome = await runTrashRemovalFlow(
      context: context,
      title: tool.title,
      accentColor: tool.accentColor,
      selectedItems: selected,
      trashService: ref.read(trashServiceProvider),
      permanent: tool.scanType == MyToolScanType.trashBins,
      requireConfirmation: ref.read(settingsProvider).confirmBeforeRemoving,
    );
    if (outcome == null) return;
    notifier.applyActiveDetailRemovalOutcome(outcome: outcome);
  }

  MyTool? _findActiveTool(MyToolsState state) {
    final activeId = state.activeDetailToolId;
    if (activeId == null) return null;
    for (final tool in state.tools) {
      if (tool.id == activeId) return tool;
    }
    return null;
  }

  bool _supportsDirectoryPicker(MyTool tool) {
    return switch (tool.scanType) {
      MyToolScanType.largeAndOldFiles => true,
      MyToolScanType.duplicateFinder => true,
      MyToolScanType.similarImages => true,
      _ => false,
    };
  }
}

Future<String?> _pickDirectory({String? initialDirectory}) {
  return FilePicker.platform.getDirectoryPath(
    dialogTitle: t.projectDirectory.chooseFolder,
    initialDirectory: initialDirectory,
    lockParentWindow: true,
  );
}

class _ToolDetailView extends StatelessWidget {
  final MyTool tool;
  final ScanResult result;
  final bool isCleaning;
  final VoidCallback onBack;
  final ValueChanged<int> onToggleItem;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;

  const _ToolDetailView({
    required this.tool,
    required this.result,
    required this.isCleaning,
    required this.onBack,
    required this.onToggleItem,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onClean,
    required this.onRescan,
  });

  @override
  Widget build(BuildContext context) {
    final detailTheme = SectionTheme(
      id: 'my_tools_${tool.id}',
      title: tool.title,
      subtitle: tool.description,
      icon: tool.icon,
      features: const [],
      backgroundGradient: SectionThemes.myTools.backgroundGradient,
      accentColor: tool.accentColor,
      orbColor: tool.accentColor,
    );

    return Stack(
      children: [
        ScanResultsView(
          result: result,
          theme: detailTheme,
          isCleaning: isCleaning,
          onToggleItem: onToggleItem,
          onSelectAll: onSelectAll,
          onDeselectAll: onDeselectAll,
          onClean: onClean,
          onRescan: onRescan,
          enableOpen: tool.scanType != MyToolScanType.timeMachineSnapshots,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: FilledButton.icon(
                onPressed: onBack,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.35),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: Text(context.t.myToolsPage.backToTools),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onQueryChanged;

  const _Header({required this.controller, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.myToolsPage.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.0,
                  height: 1.0,
                ),
              ),
              SizedBox(height: 9),
              Text(
                context.t.myToolsPage.subtitle,
                style: TextStyle(
                  color: Color(0xFFC4BBD9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: _SearchField(
            controller: controller,
            onChanged: onQueryChanged,
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: context.t.searchAndSort.searchHint,
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.white.withValues(alpha: 0.64),
          size: 21,
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.13),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.38)),
        ),
      ),
    );
  }
}

class _AtmosphereLayer extends StatelessWidget {
  const _AtmosphereLayer();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -120,
            left: -90,
            child: _GlowBlob(
              width: 420,
              height: 280,
              color: const Color(0xFF9A6CFF).withValues(alpha: 0.26),
            ),
          ),
          Positioned(
            top: -100,
            right: -120,
            child: _GlowBlob(
              width: 380,
              height: 240,
              color: const Color(0xFF80B7FF).withValues(alpha: 0.17),
            ),
          ),
          Positioned(
            bottom: -160,
            left: 130,
            child: _GlowBlob(
              width: 520,
              height: 360,
              color: const Color(0xFF6E4CB8).withValues(alpha: 0.18),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const _GlowBlob({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0.02)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
