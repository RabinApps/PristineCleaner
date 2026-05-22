import 'package:flutter/material.dart';

import '../../core/models/scan_result.dart';
import '../../gen/strings.g.dart';
import '../../core/theme/section_themes.dart';
import '../../core/utils/file_launcher.dart';
import 'file_list_tile.dart';
import 'scan_button.dart';
import 'search_and_sort_bar.dart';

class ScanResultsView extends StatefulWidget {
  final ScanResult result;
  final SectionTheme theme;
  final bool isCleaning;
  final ValueChanged<int> onToggleItem;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;
  final bool enableOpen;

  const ScanResultsView({
    super.key,
    required this.result,
    required this.theme,
    required this.isCleaning,
    required this.onToggleItem,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onClean,
    required this.onRescan,
    this.enableOpen = true,
  });

  @override
  State<ScanResultsView> createState() => _ScanResultsViewState();
}

class _ScanResultsViewState extends State<ScanResultsView> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearch = false;
  String _searchQuery = '';
  late TextEditingController _searchController;
  SortBy _sortBy = SortBy.size;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<int> _getFilteredAndSortedIndices() {
    final indices = List<int>.generate(widget.result.items.length, (i) => i);

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      indices.retainWhere((i) {
        final item = widget.result.items[i];
        return item.name.toLowerCase().contains(query) ||
            (item.group?.toLowerCase().contains(query) ?? false);
      });
    }

    // Sort
    indices.sort((aIdx, bIdx) {
      final a = widget.result.items[aIdx];
      final b = widget.result.items[bIdx];

      return switch (_sortBy) {
        SortBy.size => b.sizeBytes.compareTo(a.sizeBytes), // Descending
        SortBy.name => a.name.compareTo(b.name), // Ascending
        SortBy.ascending => a.sizeBytes.compareTo(b.sizeBytes),
        SortBy.descending => b.sizeBytes.compareTo(a.sizeBytes),
      };
    });

    return indices;
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.result.selectedItems.length;
    final allSelected = selectedCount == widget.result.items.length;
    final filteredIndices = _getFilteredAndSortedIndices();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.theme.backgroundGradient,
        ),
      ),
      child: Column(
        children: [
          // ── Search and sort bar ────────────────────────────────────────
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border(
                bottom: BorderSide(color: Colors.white.withOpacity(0.07)),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Spacer(),
                SearchAndSortBar(
                  accentColor: widget.theme.accentColor,
                  showSearch: _showSearch,
                  searchController: _searchController,
                  onToggleSearch: () {
                    setState(() {
                      _showSearch = !_showSearch;
                      if (!_showSearch) {
                        _searchQuery = '';
                        _searchController.clear();
                      }
                    });
                  },
                  onSearchChanged: (v) => setState(() => _searchQuery = v),
                  sortBy: _sortBy,
                  onSortChanged: (v) => setState(() => _sortBy = v),
                ),
              ],
            ),
          ),

          // ── Info bar ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.scanResults.itemsSummary
                          .replaceAll('{count}', '${filteredIndices.length}')
                          .replaceAll('{size}', widget.result.formattedTotal),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.t.scanResults.scannedInMs.replaceAll(
                        '{ms}',
                        '${widget.result.scanDuration.inMilliseconds}',
                      ),
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Select all toggle
                TextButton.icon(
                  onPressed: allSelected
                      ? widget.onDeselectAll
                      : widget.onSelectAll,
                  icon: Icon(
                    allSelected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    size: 16,
                    color: widget.theme.accentColor,
                  ),
                  label: Text(
                    allSelected
                        ? context.t.scanResults.deselectAll
                        : context.t.scanResults.selectAll,
                    style: TextStyle(
                      color: widget.theme.accentColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── File list ──────────────────────────────────────────────────
          Expanded(
            child: filteredIndices.isEmpty
                ? Center(
                    child: Text(
                      _searchQuery.isNotEmpty
                          ? context.t.scanResults.noItemsMatchSearch
                          : context.t.scanResults.noItemsFound,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  )
                : Scrollbar(
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: filteredIndices.length,
                      itemBuilder: (context, index) {
                        final itemIndex = filteredIndices[index];
                        return FileListTile(
                          item: widget.result.items[itemIndex],
                          accentColor: widget.theme.accentColor,
                          onChanged: (_) => widget.onToggleItem(itemIndex),
                          onOpen: widget.enableOpen
                              ? () => revealFileOrFolder(
                                  widget.result.items[itemIndex].path,
                                )
                              : null,
                        );
                      },
                    ),
                  ),
          ),

          // ── Footer action bar ──────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.06)),
              ),
            ),
            child: Row(
              children: [
                // Selected summary
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.scanResults.itemsSelected.replaceAll(
                        '{count}',
                        '$selectedCount',
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      widget.result.formattedSelected,
                      style: TextStyle(
                        color: widget.theme.accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Rescan button
                OutlinedButton(
                  onPressed: widget.isCleaning ? null : widget.onRescan,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white60,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(context.t.scanResults.rescan),
                ),
                const SizedBox(width: 12),
                // Clean button
                ScanButton(
                  color: widget.theme.accentColor,
                  label: 'Clean',
                  isLoading: widget.isCleaning,
                  onPressed: (selectedCount == 0 || widget.isCleaning)
                      ? null
                      : widget.onClean,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
