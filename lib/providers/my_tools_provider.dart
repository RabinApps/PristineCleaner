import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen/strings.g.dart';
import '../core/models/file_item.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../services/file_service.dart';
import '../services/my_tools_service.dart';
import '../services/trash_service.dart';
import '../core/utils/format_utils.dart';
import '../core/models/my_tool.dart';

final myToolsProvider = NotifierProvider<MyToolsNotifier, MyToolsState>(
  MyToolsNotifier.new,
);

class ToolScanSummary {
  final int itemCount;
  final int totalBytes;
  final DateTime scannedAt;
  final String message;

  const ToolScanSummary({
    required this.itemCount,
    required this.totalBytes,
    required this.scannedAt,
    required this.message,
  });

  String get subtitle {
    if (itemCount <= 0) return message;
    return t.myToolsMessages.itemsWithSize
        .replaceAll('{count}', '$itemCount')
        .replaceAll('{size}', formatBytes(totalBytes));
  }
}

class ToolRunOutcome {
  final ToolScanSummary summary;
  final ScanResult? result;

  const ToolRunOutcome({required this.summary, this.result});
}

class MyToolsState {
  final List<MyTool> tools;
  final String query;
  final Map<String, String> selectedDirectories;
  final Set<String> runningToolIds;
  final Map<String, ToolScanSummary> summaries;
  final String? activeDetailToolId;
  final ScanResult? activeDetailResult;
  final bool isCleaningDetail;
  final String? lastNotice;

  const MyToolsState({
    required this.tools,
    this.query = '',
    this.selectedDirectories = const <String, String>{},
    this.runningToolIds = const <String>{},
    this.summaries = const <String, ToolScanSummary>{},
    this.activeDetailToolId,
    this.activeDetailResult,
    this.isCleaningDetail = false,
    this.lastNotice,
  });

  List<MyTool> get filteredTools {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return tools;
    return tools
        .where((tool) {
          return tool.title.toLowerCase().contains(needle) ||
              tool.description.toLowerCase().contains(needle);
        })
        .toList(growable: false);
  }

  MyToolsState copyWith({
    List<MyTool>? tools,
    String? query,
    Map<String, String>? selectedDirectories,
    Set<String>? runningToolIds,
    Map<String, ToolScanSummary>? summaries,
    String? activeDetailToolId,
    ScanResult? activeDetailResult,
    bool? isCleaningDetail,
    String? lastNotice,
    bool clearActiveDetail = false,
    bool clearActiveDetailResult = false,
    bool clearLastNotice = false,
  }) {
    return MyToolsState(
      tools: tools ?? this.tools,
      query: query ?? this.query,
      selectedDirectories: selectedDirectories ?? this.selectedDirectories,
      runningToolIds: runningToolIds ?? this.runningToolIds,
      summaries: summaries ?? this.summaries,
      activeDetailToolId: clearActiveDetail
          ? null
          : (activeDetailToolId ?? this.activeDetailToolId),
      activeDetailResult: clearActiveDetailResult
          ? null
          : (activeDetailResult ?? this.activeDetailResult),
      isCleaningDetail: isCleaningDetail ?? this.isCleaningDetail,
      lastNotice: clearLastNotice ? null : (lastNotice ?? this.lastNotice),
    );
  }
}

class MyToolsNotifier extends Notifier<MyToolsState> {
  @override
  MyToolsState build() {
    final tools = _defaultTools();
    final selectedDirectories = <String, String>{
      for (final tool in tools)
        if (_toolUsesDirectorySelector(tool))
          tool.id: _defaultDirectoryFor(tool),
    };
    return MyToolsState(tools: tools, selectedDirectories: selectedDirectories);
  }

  void setQuery(String value) {
    state = state.copyWith(query: value);
  }

  void clearNotice() {
    if (state.lastNotice != null) {
      state = state.copyWith(clearLastNotice: true);
    }
  }

  void setToolDirectory(String toolId, String path) {
    final cleanPath = path.trim();
    if (cleanPath.isEmpty) return;
    final updated = Map<String, String>.from(state.selectedDirectories)
      ..[toolId] = cleanPath;
    state = state.copyWith(selectedDirectories: updated, clearLastNotice: true);
  }

  String directoryForTool(MyTool tool) {
    return state.selectedDirectories[tool.id] ?? _defaultDirectoryFor(tool);
  }

  Future<void> runTool(MyTool tool) async {
    if (state.runningToolIds.contains(tool.id)) return;

    final running = <String>{...state.runningToolIds, tool.id};
    state = state.copyWith(
      runningToolIds: running,
      clearLastNotice: true,
      isCleaningDetail: false,
    );

    try {
      final outcome = await _execute(tool);
      final updated = Map<String, ToolScanSummary>.from(state.summaries)
        ..[tool.id] = outcome.summary;
      state = state.copyWith(
        summaries: updated,
        lastNotice: '${tool.title}: ${outcome.summary.subtitle}',
        activeDetailToolId: outcome.result != null ? tool.id : null,
        activeDetailResult: outcome.result,
      );
    } on ScanCancelledException {
      state = state.copyWith(
        lastNotice: '${tool.title}: ${t.myToolsMessages.scanCancelled}',
      );
    } catch (e) {
      state = state.copyWith(lastNotice: '${tool.title}: ${_prettyError(e)}');
    } finally {
      final nextRunning = <String>{...state.runningToolIds}..remove(tool.id);
      state = state.copyWith(runningToolIds: nextRunning);
    }
  }

  void closeDetail() {
    state = state.copyWith(
      clearActiveDetail: true,
      clearActiveDetailResult: true,
      isCleaningDetail: false,
    );
  }

  void toggleActiveDetailItem(int index) {
    final result = state.activeDetailResult;
    if (result == null || index < 0 || index >= result.items.length) return;
    final items = List.of(result.items);
    final item = items[index];
    items[index] = item.copyWith(isSelected: !item.isSelected);
    state = state.copyWith(activeDetailResult: result.withUpdatedItems(items));
  }

  void selectAllActiveDetail() {
    final result = state.activeDetailResult;
    if (result == null) return;
    final items = result.items
        .map((item) => item.copyWith(isSelected: true))
        .toList(growable: false);
    state = state.copyWith(activeDetailResult: result.withUpdatedItems(items));
  }

  void deselectAllActiveDetail() {
    final result = state.activeDetailResult;
    if (result == null) return;
    final items = result.items
        .map((item) => item.copyWith(isSelected: false))
        .toList(growable: false);
    state = state.copyWith(activeDetailResult: result.withUpdatedItems(items));
  }

  Future<void> rescanActiveDetail() async {
    final toolId = state.activeDetailToolId;
    if (toolId == null) return;
    final tool = _findToolById(toolId);
    if (tool == null) return;
    await runTool(tool);
  }

  Future<void> cleanActiveDetail() async {
    final result = state.activeDetailResult;
    final toolId = state.activeDetailToolId;
    if (result == null || toolId == null) return;
    final tool = _findToolById(toolId);
    if (tool == null) return;

    final selected = result.selectedItems;
    if (selected.isEmpty) {
      state = state.copyWith(lastNotice: t.myToolsMessages.selectAtLeastOne);
      return;
    }

    state = state.copyWith(isCleaningDetail: true, clearLastNotice: true);
    try {
      final errors = await _deleteSelectedItems(tool: tool, selected: selected);
      if (errors.isNotEmpty) {
        state = state.copyWith(
          isCleaningDetail: false,
          lastNotice: t.myToolsMessages.failedToClean.replaceAll(
            '{count}',
            '${errors.length}',
          ),
        );
        return;
      }

      final remaining = result.items
          .where((item) => !item.isSelected)
          .toList(growable: false);
      final totalBytes = remaining.fold<int>(
        0,
        (sum, item) => sum + item.sizeBytes,
      );
      final updatedResult = ScanResult(
        items: remaining,
        totalBytes: totalBytes,
        scanDuration: result.scanDuration,
      );

      final updatedSummary = ToolScanSummary(
        itemCount: remaining.length,
        totalBytes: totalBytes,
        scannedAt: DateTime.now(),
        message: remaining.isEmpty
            ? t.myToolsMessages.everythingSelectedCleaned
            : t.myToolsMessages.cleanupUpdated,
      );
      final summaries = Map<String, ToolScanSummary>.from(state.summaries)
        ..[toolId] = updatedSummary;

      state = state.copyWith(
        summaries: summaries,
        activeDetailResult: updatedResult,
        isCleaningDetail: false,
        lastNotice: t.myToolsMessages.cleanedCount.replaceAll(
          '{count}',
          '${selected.length}',
        ),
      );
    } catch (e) {
      state = state.copyWith(
        isCleaningDetail: false,
        lastNotice: _prettyError(e),
      );
    }
  }

  void applyActiveDetailRemovalOutcome({required RemovalOutcome outcome}) {
    final result = state.activeDetailResult;
    final toolId = state.activeDetailToolId;
    if (result == null || toolId == null) return;

    final deletedPaths = outcome.deletedItems.map((item) => item.path).toSet();
    final remaining = result.items
        .where((item) => !deletedPaths.contains(item.path))
        .toList(growable: false);
    final totalBytes = remaining.fold<int>(
      0,
      (sum, item) => sum + item.sizeBytes,
    );

    final updatedResult = ScanResult(
      items: remaining,
      totalBytes: totalBytes,
      scanDuration: result.scanDuration,
    );
    final updatedSummary = ToolScanSummary(
      itemCount: remaining.length,
      totalBytes: totalBytes,
      scannedAt: DateTime.now(),
      message: remaining.isEmpty
          ? t.myToolsMessages.everythingSelectedCleaned
          : t.myToolsMessages.cleanupUpdated,
    );
    final summaries = Map<String, ToolScanSummary>.from(state.summaries)
      ..[toolId] = updatedSummary;

    final failures = outcome.errors.length;
    final stopPrefix = outcome.stoppedByUser
        ? t.myToolsMessages.stoppedPrefix
        : '';
    final failureSuffix = failures > 0
        ? t.myToolsMessages.failedCountShort.replaceAll('{count}', '$failures')
        : '';
    state = state.copyWith(
      summaries: summaries,
      activeDetailResult: updatedResult,
      isCleaningDetail: false,
      lastNotice:
          ('$stopPrefix${t.myToolsMessages.removedCount.replaceAll('{count}', '${outcome.deletedCount}')}$failureSuffix')
              .trim(),
    );
  }

  Future<List<String>> _deleteSelectedItems({
    required MyTool tool,
    required List<FileItem> selected,
  }) {
    if (tool.scanType == MyToolScanType.timeMachineSnapshots) {
      final ids = selected.map((item) => item.path).toList(growable: false);
      return ref.read(myToolsServiceProvider).deleteTimeMachineSnapshots(ids);
    }

    final permanent = tool.scanType == MyToolScanType.trashBins;
    return ref
        .read(trashServiceProvider)
        .deleteItems(selected, permanent: permanent);
  }

  Future<ToolRunOutcome> _execute(MyTool tool) async {
    final fileService = ref.read(fileServiceProvider);
    final toolsService = ref.read(myToolsServiceProvider);

    switch (tool.scanType) {
      case MyToolScanType.downloads:
        final result = await fileService.scanDownloads();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.downloadsTidy,
        );
      case MyToolScanType.largeAndOldFiles:
        final result = await fileService.scanLargeAndOldFiles(
          directoryForTool(tool),
        );
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noOversizedStale,
        );
      case MyToolScanType.duplicateFinder:
        final result = await fileService.scanFreshDuplicates(
          directoryForTool(tool),
        );
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noRecentDuplicates,
        );
      case MyToolScanType.similarImages:
        final result = await fileService.scanLargeSimilarImages(
          directoryForTool(tool),
        );
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noSimilarLargeImages,
        );
      case MyToolScanType.appLeftovers:
        final result = await fileService.scanAppLeftovers();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noAppLeftovers,
        );
      case MyToolScanType.systemJunk:
        final result = await fileService.scanCleanup();
        return _outcomeFromFilteredResult(
          result,
          categories: const {'user_cache', 'user_logs', 'system_logs'},
          fallback: t.myToolsMessages.fallback.noSystemJunkCandidates,
        );
      case MyToolScanType.loginItems:
        final result = await fileService.scanCleanup();
        return _outcomeFromFilteredResult(
          result,
          categories: const {'broken_login_items'},
          fallback: t.myToolsMessages.fallback.noBrokenStartup,
        );
      case MyToolScanType.backgroundItems:
        final result = await toolsService.scanBackgroundItems();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noBackgroundItems,
        );
      case MyToolScanType.trashBins:
        final result = await toolsService.scanTrashBins();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.trashAlreadyEmpty,
        );
      case MyToolScanType.applicationPermissions:
        final result = await toolsService.scanApplicationPermissions();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noPermissionCache,
        );
      case MyToolScanType.timeMachineSnapshots:
        final result = await toolsService.scanTimeMachineSnapshots();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noTimeMachineSnapshots,
        );
      case MyToolScanType.mailAttachments:
        final result = await toolsService.scanMailAttachments();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noMailAttachments,
        );
      case MyToolScanType.malwareFinder:
        final result = await toolsService.scanMalwareCandidates();
        return _outcomeFromResult(
          result,
          fallback: t.myToolsMessages.fallback.noSuspiciousFiles,
        );
    }
  }

  MyTool? _findToolById(String toolId) {
    for (final entry in state.tools) {
      if (entry.id == toolId) return entry;
    }
    return null;
  }

  ToolRunOutcome _outcomeFromResult(
    ScanResult result, {
    required String fallback,
  }) {
    return ToolRunOutcome(
      summary: ToolScanSummary(
        itemCount: result.items.length,
        totalBytes: result.totalBytes,
        scannedAt: DateTime.now(),
        message: result.items.isEmpty
            ? fallback
            : t.myToolsMessages.scanComplete,
      ),
      result: result,
    );
  }

  ToolRunOutcome _outcomeFromFilteredResult(
    ScanResult result, {
    required Set<String> categories,
    required String fallback,
  }) {
    final matched = result.items
        .where((item) {
          return item.category != null && categories.contains(item.category);
        })
        .toList(growable: false);

    final bytes = matched.fold<int>(0, (sum, item) => sum + item.sizeBytes);
    final filtered = ScanResult(
      items: matched,
      totalBytes: bytes,
      scanDuration: result.scanDuration,
    );
    return ToolRunOutcome(
      summary: ToolScanSummary(
        itemCount: matched.length,
        totalBytes: bytes,
        scannedAt: DateTime.now(),
        message: matched.isEmpty ? fallback : t.myToolsMessages.scanComplete,
      ),
      result: filtered,
    );
  }

  bool _toolUsesDirectorySelector(MyTool tool) {
    return switch (tool.scanType) {
      MyToolScanType.largeAndOldFiles => true,
      MyToolScanType.duplicateFinder => true,
      MyToolScanType.similarImages => true,
      _ => false,
    };
  }

  String _defaultDirectoryFor(MyTool tool) {
    final home = _homePath;
    switch (tool.scanType) {
      case MyToolScanType.similarImages:
        final pictures = Platform.isWindows
            ? '$home\\Pictures'
            : '$home/Pictures';
        if (Directory(pictures).existsSync()) {
          return pictures;
        }
        return home;
      case MyToolScanType.largeAndOldFiles:
      case MyToolScanType.duplicateFinder:
        return home;
      default:
        return home;
    }
  }

  String get _homePath {
    if (Platform.isWindows) {
      final userProfile = Platform.environment['USERPROFILE'];
      if (userProfile != null && userProfile.isNotEmpty) {
        return userProfile;
      }
    }
    final home = Platform.environment['HOME'];
    if (home != null && home.isNotEmpty) {
      return home;
    }
    return Directory.current.path;
  }

  String _prettyError(Object error) {
    final raw = error.toString().trim();
    if (raw.isEmpty) return t.myToolsMessages.somethingWentWrong;
    if (raw.length > 170) {
      return '${raw.substring(0, 170)}...';
    }
    return raw;
  }
}

List<MyTool> _defaultTools() {
  return [
    MyTool(
      id: 'app_leftovers',
      title: t.myToolsCatalog.appLeftovers.title,
      description: t.myToolsCatalog.appLeftovers.description,
      icon: Icons.extension_rounded,
      accentColor: Color(0xFF2EA2FF),
      scanType: MyToolScanType.appLeftovers,
    ),
    MyTool(
      id: 'background_items',
      title: t.myToolsCatalog.backgroundItems.title,
      description: t.myToolsCatalog.backgroundItems.description,
      icon: Icons.rocket_launch_rounded,
      accentColor: Color(0xFFFF9D2A),
      scanType: MyToolScanType.backgroundItems,
    ),
    MyTool(
      id: 'downloads',
      title: t.myToolsCatalog.downloads.title,
      description: t.myToolsCatalog.downloads.description,
      icon: Icons.download_for_offline_rounded,
      accentColor: Color(0xFF29CAD6),
      scanType: MyToolScanType.downloads,
    ),
    MyTool(
      id: 'large_old',
      title: t.myToolsCatalog.largeOld.title,
      description: t.myToolsCatalog.largeOld.description,
      icon: Icons.folder_copy_rounded,
      accentColor: Color(0xFF30D7C0),
      locationLabel: 'Home',
      scanType: MyToolScanType.largeAndOldFiles,
    ),
    MyTool(
      id: 'similar_images',
      title: t.myToolsCatalog.similarImages.title,
      description: t.myToolsCatalog.similarImages.description,
      icon: Icons.filter_tilt_shift_rounded,
      accentColor: Color(0xFF2ABCC5),
      locationLabel: 'Pictures',
      scanType: MyToolScanType.similarImages,
    ),
    MyTool(
      id: 'trash_bins',
      title: t.myToolsCatalog.trashBins.title,
      description: t.myToolsCatalog.trashBins.description,
      icon: Icons.delete_outline_rounded,
      accentColor: Color(0xFF54D763),
      showStar: true,
      scanType: MyToolScanType.trashBins,
    ),
    MyTool(
      id: 'duplicate_finder',
      title: t.myToolsCatalog.duplicateFinder.title,
      description: t.myToolsCatalog.duplicateFinder.description,
      icon: Icons.copy_all_rounded,
      accentColor: Color(0xFF2ABCC5),
      locationLabel: 'Home',
      scanType: MyToolScanType.duplicateFinder,
    ),
    MyTool(
      id: 'application_permissions',
      title: t.myToolsCatalog.applicationPermissions.title,
      description: t.myToolsCatalog.applicationPermissions.description,
      icon: Icons.lock_rounded,
      accentColor: Color(0xFFFF52CB),
      scanType: MyToolScanType.applicationPermissions,
    ),
    MyTool(
      id: 'system_junk',
      title: t.myToolsCatalog.systemJunk.title,
      description: t.myToolsCatalog.systemJunk.description,
      icon: Icons.cleaning_services_rounded,
      accentColor: Color(0xFF58D948),
      scanType: MyToolScanType.systemJunk,
    ),
    MyTool(
      id: 'time_machine_snapshots',
      title: t.myToolsCatalog.timeMachineSnapshot.title,
      description: t.myToolsCatalog.timeMachineSnapshot.description,
      icon: Icons.history_toggle_off_rounded,
      accentColor: Color(0xFFFFB341),
      scanType: MyToolScanType.timeMachineSnapshots,
    ),
    MyTool(
      id: 'login_items',
      title: t.myToolsCatalog.loginItems.title,
      description: t.myToolsCatalog.loginItems.description,
      icon: Icons.power_settings_new_rounded,
      accentColor: Color(0xFFFF9D2A),
      scanType: MyToolScanType.loginItems,
    ),
    MyTool(
      id: 'mail_attachments',
      title: t.myToolsCatalog.mailAttachments.title,
      description: t.myToolsCatalog.mailAttachments.description,
      icon: Icons.mark_email_read_rounded,
      accentColor: Color(0xFF54D763),
      scanType: MyToolScanType.mailAttachments,
    ),
    MyTool(
      id: 'malware_finder',
      title: t.myToolsCatalog.malwareFinder.title,
      description: t.myToolsCatalog.malwareFinder.description,
      icon: Icons.security_rounded,
      accentColor: Color(0xFFFF52CB),
      scanType: MyToolScanType.malwareFinder,
    ),
    MyTool(
      id: 'uninstaller',
      title: t.myToolsCatalog.uninstaller.title,
      description: t.myToolsCatalog.uninstaller.description,
      icon: Icons.build_circle_rounded,
      accentColor: Color(0xFF3AA6FF),
      scanType: MyToolScanType.appLeftovers,
    ),
  ];
}
