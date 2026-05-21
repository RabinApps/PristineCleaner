import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/file_item.dart';
import '../../core/theme/section_themes.dart';
import '../../core/utils/format_utils.dart';
import '../../core/utils/file_launcher.dart';
import '../../shared/widgets/glossy_icon_widget.dart';
import '../../shared/widgets/scan_button.dart';
import '../../shared/widgets/search_and_sort_bar.dart';
import 'space_lens_provider.dart';

class SpaceLensScreen extends ConsumerWidget {
  const SpaceLensScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(spaceLensProvider);
    final notifier = ref.read(spaceLensProvider.notifier);
    const theme = SectionThemes.spaceLens;

    if (vm.isDone) {
      return _DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    if (vm.hasResults) {
      return _SpaceLensResults(
        items: vm.result!.items,
        totalBytes: vm.result!.totalBytes,
        theme: theme,
        isCleaning: vm.isCleaning,
        onToggle: notifier.toggleItem,
        onBrowseFolder: notifier.listDirectoryContents,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onClean: notifier.clean,
        onRescan: notifier.scan,
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlossyIconWidget(
                    baseColor: theme.orbColor,
                    icon: theme.icon,
                    size: 258,
                    shape: OrbShape.squircle,
                  ),
                  const SizedBox(width: 60),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Space Lens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        theme.subtitle,
                        style: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ...theme.features.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.accentColor.withOpacity(0.18),
                                  border: Border.all(
                                    color: theme.accentColor.withOpacity(0.35),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  f.icon,
                                  size: 15,
                                  color: theme.accentColor,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                f.label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (vm.isScanning && vm.progressPercent != null) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: LinearProgressIndicator(
                                  value: vm.progressPercent!.clamp(0.0, 1.0),
                                  minHeight: 8,
                                  backgroundColor: Colors.white12,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.accentColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                vm.progressLabel ??
                                    '${(vm.progressPercent! * 100).toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (vm.error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          vm.error!,
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Center(
              child: ScanButton(
                color: vm.isScanning ? Colors.redAccent : theme.accentColor,
                label: vm.isScanning ? 'Stop' : 'Scan',
                isLoading: false,
                onPressed: vm.isScanning
                    ? () async {
                        final shouldStop =
                            await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xFF191919),
                                  title: const Text(
                                    'Stop scanning?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: const Text(
                                    'This will cancel the current scan and discard any partial progress.',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(
                                        dialogContext,
                                      ).pop(false),
                                      child: const Text('Keep scanning'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(true),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                      ),
                                      child: const Text('Stop'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (shouldStop) {
                          notifier.stop();
                        }
                      }
                    : notifier.scan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpaceLensResults extends StatefulWidget {
  final List<FileItem> items;
  final int totalBytes;
  final SectionTheme theme;
  final bool isCleaning;
  final ValueChanged<int> onToggle;
  final Future<List<FileItem>> Function(String path) onBrowseFolder;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;

  const _SpaceLensResults({
    required this.items,
    required this.totalBytes,
    required this.theme,
    required this.isCleaning,
    required this.onToggle,
    required this.onBrowseFolder,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onClean,
    required this.onRescan,
  });

  @override
  State<_SpaceLensResults> createState() => _SpaceLensResultsState();
}

class _SpaceLensResultsState extends State<_SpaceLensResults> {
  bool _showSearch = false;
  String _searchQuery = '';
  late TextEditingController _searchController;
  final ScrollController _scrollController = ScrollController();
  SortBy _sortBy = SortBy.size;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<int> _getFilteredAndSortedIndices() {
    final indices = List<int>.generate(widget.items.length, (i) => i);

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      indices.retainWhere((i) {
        final item = widget.items[i];
        return item.name.toLowerCase().contains(query);
      });
    }

    // Sort
    indices.sort((aIdx, bIdx) {
      final a = widget.items[aIdx];
      final b = widget.items[bIdx];

      return switch (_sortBy) {
        SortBy.size => b.sizeBytes.compareTo(a.sizeBytes), // Descending
        SortBy.name => a.name.compareTo(b.name), // Ascending A-Z
        SortBy.ascending => a.sizeBytes.compareTo(b.sizeBytes),
        SortBy.descending => b.sizeBytes.compareTo(a.sizeBytes),
      };
    });

    return indices;
  }

  Future<void> _openDirectoryBrowser(FileItem root) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return _DirectoryBrowserDialog(
          rootPath: root.path,
          rootName: root.name,
          accentColor: widget.theme.accentColor,
          onLoad: widget.onBrowseFolder,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredIndices = _getFilteredAndSortedIndices();
    final filteredItems = [
      for (final idx in filteredIndices) widget.items[idx],
    ];
    final maxBytes = filteredItems.isNotEmpty
        ? filteredItems.first.sizeBytes
        : 1;

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
                  sortOptions: const [
                    SortBy.size,
                    SortBy.name,
                    SortBy.ascending,
                    SortBy.descending,
                  ],
                ),
              ],
            ),
          ),

          // ── Header ─────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Row(
              children: [
                Text(
                  'Storage map  •  ${formatBytes(widget.totalBytes)} total',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: widget.onSelectAll,
                  icon: Icon(
                    Icons.check_box_rounded,
                    size: 16,
                    color: widget.theme.accentColor,
                  ),
                  label: Text(
                    'Select All',
                    style: TextStyle(
                      color: widget.theme.accentColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Bar chart list ────────────────────────────────────────────
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      _searchQuery.isNotEmpty
                          ? 'No folders match your search'
                          : 'No folders found',
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
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final originalIndex = filteredIndices[index];
                        final item = filteredItems[index];
                        final ratio = maxBytes > 0
                            ? item.sizeBytes / maxBytes
                            : 0.0;
                        return _FolderBar(
                          item: item,
                          ratio: ratio,
                          accentColor: widget.theme.accentColor,
                          onTap: () => widget.onToggle(originalIndex),
                          onBrowse: () => _openDirectoryBrowser(item),
                        );
                      },
                    ),
                  ),
          ),

          // ── Footer ─────────────────────────────────────────────────────
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
                Text(
                  '${widget.items.where((i) => i.isSelected).length} folders selected',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const Spacer(),
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
                ScanButton(
                  color: widget.theme.accentColor,
                  label: 'Clean',
                  isLoading: widget.isCleaning,
                  onPressed:
                      (widget.items.every((i) => !i.isSelected) ||
                          widget.isCleaning)
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

class _FolderBar extends StatelessWidget {
  final FileItem item;
  final double ratio;
  final Color accentColor;
  final VoidCallback onTap;
  final VoidCallback onBrowse;

  const _FolderBar({
    required this.item,
    required this.ratio,
    required this.accentColor,
    required this.onTap,
    required this.onBrowse,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: item.isSelected
              ? accentColor.withOpacity(0.1)
              : Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: item.isSelected
                ? accentColor.withOpacity(0.3)
                : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: item.isSelected,
                  onChanged: (_) => onTap(),
                  activeColor: accentColor,
                  side: const BorderSide(color: Colors.white30),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const SizedBox(width: 6),
                const Icon(Icons.folder_rounded, size: 16, color: Colors.amber),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  item.formattedSize,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Tooltip(
                  message: 'Browse folder',
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                      size: 18,
                      color: Colors.white54,
                    ),
                    onPressed: onBrowse,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    padding: EdgeInsets.zero,
                    splashRadius: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 44),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: ratio,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    accentColor.withOpacity(0.7),
                  ),
                  minHeight: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DirectoryBrowserDialog extends StatefulWidget {
  final String rootPath;
  final String rootName;
  final Color accentColor;
  final Future<List<FileItem>> Function(String path) onLoad;

  const _DirectoryBrowserDialog({
    required this.rootPath,
    required this.rootName,
    required this.accentColor,
    required this.onLoad,
  });

  @override
  State<_DirectoryBrowserDialog> createState() =>
      _DirectoryBrowserDialogState();
}

class _DirectoryBrowserDialogState extends State<_DirectoryBrowserDialog> {
  late String _currentPath;
  late String _currentName;
  final List<_BreadcrumbNode> _trail = [];
  bool _isLoading = true;
  String? _error;
  List<FileItem> _entries = const [];

  @override
  void initState() {
    super.initState();
    _currentPath = widget.rootPath;
    _currentName = widget.rootName;
    _trail.add(_BreadcrumbNode(name: widget.rootName, path: widget.rootPath));
    _loadCurrent();
  }

  Future<void> _loadCurrent() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final items = await widget.onLoad(_currentPath);
      if (!mounted) return;
      setState(() {
        _entries = items;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _openEntry(FileItem item) async {
    if (item.isDirectory) {
      setState(() {
        _currentPath = item.path;
        _currentName = item.name;
        _trail.add(_BreadcrumbNode(name: item.name, path: item.path));
      });
      await _loadCurrent();
      return;
    }
    await revealFileOrFolder(item.path);
  }

  Future<void> _goToCrumb(int index) async {
    final node = _trail[index];
    setState(() {
      _currentPath = node.path;
      _currentName = node.name;
      _trail.removeRange(index + 1, _trail.length);
    });
    await _loadCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF120D1F),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: SizedBox(
        width: 860,
        height: 560,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 10, 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white.withOpacity(0.07)),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.folder_open_rounded, color: widget.accentColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < _trail.length; i++) ...[
                            InkWell(
                              onTap: () => _goToCrumb(i),
                              child: Text(
                                _trail[i].name,
                                style: TextStyle(
                                  color: i == _trail.length - 1
                                      ? Colors.white
                                      : Colors.white70,
                                  fontSize: 13,
                                  fontWeight: i == _trail.length - 1
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            ),
                            if (i != _trail.length - 1)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white38,
                                  size: 16,
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    tooltip: 'Reveal in Finder',
                    onPressed: () => revealFileOrFolder(_currentPath),
                    icon: const Icon(
                      Icons.open_in_new_rounded,
                      color: Colors.white60,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: widget.accentColor,
                      ),
                    )
                  : _error != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _error!,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    )
                  : _entries.isEmpty
                  ? Center(
                      child: Text(
                        'No files or folders in $_currentName',
                        style: const TextStyle(color: Colors.white54),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      itemCount: _entries.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: Colors.white.withOpacity(0.05),
                      ),
                      itemBuilder: (context, index) {
                        final item = _entries[index];
                        return ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          leading: Icon(
                            item.isDirectory
                                ? Icons.folder_rounded
                                : Icons.insert_drive_file_outlined,
                            color: item.isDirectory
                                ? const Color(0xFFFFCA5F)
                                : Colors.white54,
                            size: 18,
                          ),
                          title: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          subtitle: Text(
                            item.isDirectory
                                ? 'Folder • ${item.formattedSize}'
                                : item.formattedSize,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                          trailing: Icon(
                            item.isDirectory
                                ? Icons.chevron_right_rounded
                                : Icons.open_in_new_rounded,
                            color: Colors.white54,
                            size: 16,
                          ),
                          onTap: () => _openEntry(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BreadcrumbNode {
  final String name;
  final String path;

  const _BreadcrumbNode({required this.name, required this.path});
}

class _DoneScreen extends StatelessWidget {
  final SectionTheme theme;
  final VoidCallback onDismiss;
  const _DoneScreen({required this.theme, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: 72,
              color: theme.accentColor,
            ),
            const SizedBox(height: 20),
            const Text(
              'Cleaned!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: onDismiss,
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.accentColor,
                side: BorderSide(color: theme.accentColor.withOpacity(0.5)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
