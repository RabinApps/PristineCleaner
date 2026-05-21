import 'package:flutter/material.dart';

import '../../core/models/scan_result.dart';
import '../../core/theme/section_themes.dart';
import 'file_list_tile.dart';
import 'scan_button.dart';

class ScanResultsView extends StatefulWidget {
  final ScanResult result;
  final SectionTheme theme;
  final bool isCleaning;
  final ValueChanged<int> onToggleItem;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;

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
  });

  @override
  State<ScanResultsView> createState() => _ScanResultsViewState();
}

class _ScanResultsViewState extends State<ScanResultsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.result.selectedItems.length;
    final allSelected = selectedCount == widget.result.items.length;

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
          // ── Header bar ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.result.items.length} items found  •  ${widget.result.formattedTotal}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Scanned in ${widget.result.scanDuration.inMilliseconds}ms',
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
                    allSelected ? 'Deselect All' : 'Select All',
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
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: widget.result.items.length,
                itemBuilder: (context, index) {
                  return FileListTile(
                    item: widget.result.items[index],
                    accentColor: widget.theme.accentColor,
                    onChanged: (_) => widget.onToggleItem(index),
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
                      '$selectedCount items selected',
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
                  child: const Text('Rescan'),
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
