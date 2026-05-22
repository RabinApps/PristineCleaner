import 'package:flutter/material.dart';

import '../../core/models/file_item.dart';
import '../../core/models/scan_result.dart';
import '../../gen/strings.g.dart';
import '../../core/theme/section_themes.dart';
import '../../core/utils/format_utils.dart';
import 'scan_results_view.dart';

enum MyClutterView { dashboard, all, duplicates, similarImages, largeFiles }

class MyClutterResultsWorkspace extends StatelessWidget {
  final ScanResult result;
  final bool isCleaning;
  final SectionTheme theme;
  final MyClutterView view;
  final ValueChanged<MyClutterView> onViewChanged;
  final ValueChanged<int> onToggleOriginalItem;
  final void Function(Iterable<int> indexes, bool isSelected)
  onSetSelectionForIndexes;
  final VoidCallback onClean;
  final VoidCallback onRescan;

  const MyClutterResultsWorkspace({
    super.key,
    required this.result,
    required this.isCleaning,
    required this.theme,
    required this.view,
    required this.onViewChanged,
    required this.onToggleOriginalItem,
    required this.onSetSelectionForIndexes,
    required this.onClean,
    required this.onRescan,
  });

  @override
  Widget build(BuildContext context) {
    if (view == MyClutterView.dashboard) {
      return _MyClutterResultsDashboard(
        result: result,
        theme: theme,
        onReviewAll: () => onViewChanged(MyClutterView.all),
        onReviewDuplicates: () => onViewChanged(MyClutterView.duplicates),
        onReviewSimilarImages: () => onViewChanged(MyClutterView.similarImages),
        onReviewLargeFiles: () => onViewChanged(MyClutterView.largeFiles),
      );
    }

    final filteredIndices = _filterIndices(result.items, view);
    final filteredItems = filteredIndices
        .map((i) => result.items[i])
        .toList(growable: false);
    final filteredBytes = filteredItems.fold<int>(
      0,
      (sum, i) => sum + i.sizeBytes,
    );
    final filteredResult = ScanResult(
      items: filteredItems,
      totalBytes: filteredBytes,
      scanDuration: result.scanDuration,
    );

    return Stack(
      children: [
        ScanResultsView(
          result: filteredResult,
          theme: theme,
          isCleaning: isCleaning,
          onToggleItem: (index) {
            final originalIndex = filteredIndices[index];
            onToggleOriginalItem(originalIndex);
          },
          onSelectAll: () => onSetSelectionForIndexes(filteredIndices, true),
          onDeselectAll: () => onSetSelectionForIndexes(filteredIndices, false),
          onClean: onClean,
          onRescan: onRescan,
        ),
        Positioned(
          top: 12,
          left: 12,
          child: TextButton.icon(
            onPressed: () => onViewChanged(MyClutterView.dashboard),
            icon: const Icon(Icons.arrow_back_rounded, size: 16),
            label: Text(context.t.myClutterDashboard.backToCategories),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black.withValues(alpha: 0.25),
            ),
          ),
        ),
      ],
    );
  }
}

class _MyClutterResultsDashboard extends StatelessWidget {
  final ScanResult result;
  final SectionTheme theme;
  final VoidCallback onReviewAll;
  final VoidCallback onReviewDuplicates;
  final VoidCallback onReviewSimilarImages;
  final VoidCallback onReviewLargeFiles;

  const _MyClutterResultsDashboard({
    required this.result,
    required this.theme,
    required this.onReviewAll,
    required this.onReviewDuplicates,
    required this.onReviewSimilarImages,
    required this.onReviewLargeFiles,
  });

  @override
  Widget build(BuildContext context) {
    final categories = _buildCategorySummaries(result.items);
    final duplicateSummary =
        categories['fresh_duplicates'] ??
        _CategorySummary.empty(
          context.t.myClutterDashboard.freshDuplicatesFound.replaceAll(
            '{count}',
            '0',
          ),
        );
    final similarSummary =
        categories['large_similar_images'] ??
        _CategorySummary.empty(
          context.t.myClutterDashboard.largeSimilarImagesFound.replaceAll(
            '{count}',
            '0',
          ),
        );
    final largeSummary =
        categories['large_files'] ??
        _CategorySummary.empty(
          context.t.myClutterDashboard.largeFilesFound.replaceAll(
            '{bytes}',
            formatBytes(0),
          ),
        );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            Text(
              context.t.myClutterDashboard.filesToSort.replaceAll(
                '{count}',
                '${result.items.length}',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.t.myClutterDashboard.quickRecommendations,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 24),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: onReviewAll,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.18),
                foregroundColor: Colors.white,
              ),
              child: Text(context.t.myClutterDashboard.reviewAllFiles),
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _MyClutterSummaryCard(
                    title: context.t.myClutterDashboard.freshDuplicatesFound
                        .replaceAll('{count}', '${duplicateSummary.count}'),
                    subtitle: duplicateSummary.count == 0
                        ? context.t.myClutterDashboard.noDuplicates
                        : context.t.myClutterDashboard.removeDuplicateBytes
                              .replaceAll(
                                '{bytes}',
                                formatBytes(duplicateSummary.totalBytes),
                              ),
                    onReview: duplicateSummary.count == 0
                        ? null
                        : onReviewDuplicates,
                    accent: theme.accentColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _MyClutterSummaryCard(
                        title: context
                            .t
                            .myClutterDashboard
                            .largeSimilarImagesFound
                            .replaceAll('{count}', '${similarSummary.count}'),
                        subtitle: similarSummary.count == 0
                            ? context.t.myClutterDashboard.noSimilarGroups
                            : context.t.myClutterDashboard.nearlyIdenticalImages
                                  .replaceAll(
                                    '{bytes}',
                                    formatBytes(similarSummary.totalBytes),
                                  ),
                        onReview: similarSummary.count == 0
                            ? null
                            : onReviewSimilarImages,
                        accent: theme.accentColor,
                      ),
                      const SizedBox(height: 16),
                      _MyClutterSummaryCard(
                        title: context.t.myClutterDashboard.largeFilesFound
                            .replaceAll(
                              '{bytes}',
                              formatBytes(largeSummary.totalBytes),
                            ),
                        subtitle: largeSummary.count == 0
                            ? context.t.myClutterDashboard.noLargeFiles
                            : context.t.myClutterDashboard.largeFilesReady
                                  .replaceAll(
                                    '{count}',
                                    '${largeSummary.count}',
                                  ),
                        onReview: largeSummary.count == 0
                            ? null
                            : onReviewLargeFiles,
                        accent: theme.accentColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MyClutterSummaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onReview;
  final Color accent;

  const _MyClutterSummaryCard({
    required this.title,
    required this.subtitle,
    required this.onReview,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 210),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: onReview,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.18),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.white.withValues(alpha: 0.08),
                disabledForegroundColor: Colors.white38,
              ),
              child: Text(context.t.myClutterDashboard.review),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySummary {
  final String title;
  final int count;
  final int totalBytes;

  const _CategorySummary({
    required this.title,
    required this.count,
    required this.totalBytes,
  });

  factory _CategorySummary.empty(String title) =>
      _CategorySummary(title: title, count: 0, totalBytes: 0);
}

Map<String, _CategorySummary> _buildCategorySummaries(List<FileItem> items) {
  final out = <String, _CategorySummary>{};
  for (final item in items) {
    final key = item.category ?? 'large_files';
    final current = out[key];
    out[key] = _CategorySummary(
      title: key,
      count: (current?.count ?? 0) + 1,
      totalBytes: (current?.totalBytes ?? 0) + item.sizeBytes,
    );
  }
  return out;
}

List<int> _filterIndices(List<FileItem> items, MyClutterView view) {
  if (view == MyClutterView.all) {
    return List<int>.generate(items.length, (i) => i);
  }

  final targetCategory = switch (view) {
    MyClutterView.dashboard => null,
    MyClutterView.all => null,
    MyClutterView.duplicates => 'fresh_duplicates',
    MyClutterView.similarImages => 'large_similar_images',
    MyClutterView.largeFiles => 'large_files',
  };

  if (targetCategory == null) {
    return const <int>[];
  }

  final indices = <int>[];
  for (var i = 0; i < items.length; i++) {
    final category = items[i].category ?? 'large_files';
    if (category == targetCategory) {
      indices.add(i);
    }
  }
  return indices;
}
