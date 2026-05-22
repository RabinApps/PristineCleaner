import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pristine_cleaner/screens/done_screen.dart';

import '../services/trash_service.dart';
import '../core/theme/section_themes.dart';
import '../shared/removal/removal_flow.dart';
import '../shared/widgets/section_landing_layout.dart';
import '../shared/widgets/glossy_icon_widget.dart';
import '../shared/widgets/project_directory_selector.dart';
import '../providers/my_clutter_provider.dart';
import '../shared/widgets/my_clutter_results_workspace.dart';

class MyClutterScreen extends ConsumerStatefulWidget {
  const MyClutterScreen({super.key});

  @override
  ConsumerState<MyClutterScreen> createState() => _MyClutterScreenState();
}

class _MyClutterScreenState extends ConsumerState<MyClutterScreen> {
  MyClutterView _view = MyClutterView.dashboard;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myClutterProvider);
    final notifier = ref.read(myClutterProvider.notifier);
    final vm = state.vm;
    const theme = SectionThemes.myClutter;

    if (vm.isDone) {
      return DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    if (vm.hasResults) {
      return MyClutterResultsWorkspace(
        result: vm.result!,
        isCleaning: vm.isCleaning,
        theme: theme,
        view: _view,
        onViewChanged: (next) => setState(() => _view = next),
        onToggleOriginalItem: notifier.toggleItem,
        onSetSelectionForIndexes: notifier.setSelectionForIndexes,
        onClean: () {
          unawaited(_handleClean(context));
        },
        onRescan: () {
          setState(() => _view = MyClutterView.dashboard);
          notifier.scan();
        },
      );
    }

    if (_view != MyClutterView.dashboard) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _view = MyClutterView.dashboard);
        }
      });
    }

    return SectionLandingLayout(
      theme: theme,
      orbShape: OrbShape.blob,
      onScan: notifier.scan,
      onStop: notifier.stop,
      isScanning: vm.isScanning,
      progressPercent: vm.progressPercent,
      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectDirectorySelector(
            selectedPath:
                vm.selectedParentPath ?? vm.selectedParentName ?? 'No folder',
            accentColor: theme.accentColor,
            onPickFolder: () async {
              final pickedPath = await _pickNativeDirectory(
                initialDirectory: vm.selectedParentPath,
              );
              if (pickedPath != null && pickedPath.isNotEmpty) {
                await notifier.setParentFolder(pickedPath);
              }
            },
          ),
          if (vm.isScanning && vm.progressLabel != null) ...[
            const SizedBox(height: 8),
            Text(
              vm.progressLabel!,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
          if (vm.error != null) ...[
            const SizedBox(height: 10),
            Text(
              vm.error!,
              style: TextStyle(color: Colors.red.shade300, fontSize: 13),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _handleClean(BuildContext context) async {
    final vm = ref.read(myClutterProvider).vm;
    final selected = vm.result?.selectedItems ?? const [];
    if (selected.isEmpty) return;

    final outcome = await runTrashRemovalFlow(
      context: context,
      title: SectionThemes.myClutter.title,
      accentColor: SectionThemes.myClutter.accentColor,
      selectedItems: selected,
      trashService: ref.read(trashServiceProvider),
    );
    if (outcome == null) return;
    ref.read(myClutterProvider.notifier).applyRemovalOutcome(outcome);
  }
}

Future<String?> _pickNativeDirectory({String? initialDirectory}) {
  return FilePicker.platform.getDirectoryPath(
    dialogTitle: 'Choose project directory',
    initialDirectory: initialDirectory,
    lockParentWindow: true,
  );
}
