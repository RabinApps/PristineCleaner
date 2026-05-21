import 'package:flutter/material.dart';

import '../../core/models/file_item.dart';
import '../../core/models/scan_result.dart';
import '../../core/theme/section_themes.dart';
import '../../core/utils/format_utils.dart';
import '../../core/utils/file_launcher.dart';

// ─── Category metadata ─────────────────────────────────────────────────────

class _CleanupCategory {
  final String id;
  final String name;
  final String description;
  final IconData icon;

  const _CleanupCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });
}

const _kCategories = [
  _CleanupCategory(
    id: 'user_cache',
    name: 'User Cache Files',
    description:
        'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.',
    icon: Icons.cached_rounded,
  ),
  _CleanupCategory(
    id: 'user_logs',
    name: 'User Log Files',
    description:
        'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.',
    icon: Icons.article_outlined,
  ),
  _CleanupCategory(
    id: 'language_files',
    name: 'Language Files',
    description:
        'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.',
    icon: Icons.language_rounded,
  ),
  _CleanupCategory(
    id: 'system_logs',
    name: 'System Log Files',
    description:
        'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.',
    icon: Icons.settings_outlined,
  ),
  _CleanupCategory(
    id: 'broken_login_items',
    name: 'Broken Login Items',
    description:
        'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.',
    icon: Icons.link_off_rounded,
  ),
];

// ─── Group model ──────────────────────────────────────────────────────────

class _GroupEntry {
  final String name;
  final List<FileItem> items;

  _GroupEntry({required this.name, required this.items});

  int get totalBytes => items.fold(0, (s, i) => s + i.sizeBytes);
  String get formattedSize => formatBytes(totalBytes);

  bool get allSelected => items.every((i) => i.isSelected);
  bool get anySelected => items.any((i) => i.isSelected);
}

// ─── Sort order ───────────────────────────────────────────────────────────

enum _SortOrder { size, name }

// ─── Main widget ──────────────────────────────────────────────────────────

class CleanupResultsView extends StatefulWidget {
  final ScanResult result;
  final SectionTheme theme;
  final bool isCleaning;
  final ValueChanged<int> onToggleItem;
  final void Function(String category, String group, bool selected)
  onToggleGroup;
  final void Function(String category, bool selected) onToggleCategory;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;

  const CleanupResultsView({
    super.key,
    required this.result,
    required this.theme,
    required this.isCleaning,
    required this.onToggleItem,
    required this.onToggleGroup,
    required this.onToggleCategory,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onClean,
    required this.onRescan,
  });

  @override
  State<CleanupResultsView> createState() => _CleanupResultsViewState();
}

class _CleanupResultsViewState extends State<CleanupResultsView> {
  String _selectedCategoryId = 'user_cache';
  final Set<String> _expandedGroups = {};
  _SortOrder _sortOrder = _SortOrder.size;
  bool _showSearch = false;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Auto-select first category that has items.
    for (final cat in _kCategories) {
      final hasItems = widget.result.items.any((i) => i.category == cat.id);
      if (hasItems) {
        _selectedCategoryId = cat.id;
        break;
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  List<FileItem> _itemsForCategory(String categoryId) {
    var items = widget.result.items
        .where((i) => i.category == categoryId)
        .toList();
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      items = items
          .where(
            (i) =>
                i.name.toLowerCase().contains(q) ||
                (i.group?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    }
    return items;
  }

  List<_GroupEntry> _groupsForCategory(String categoryId) {
    final items = _itemsForCategory(categoryId);
    final map = <String, List<FileItem>>{};
    for (final item in items) {
      final key = item.group ?? item.name;
      map.putIfAbsent(key, () => []).add(item);
    }
    final groups = map.entries
        .map((e) => _GroupEntry(name: e.key, items: e.value))
        .toList();
    if (_sortOrder == _SortOrder.size) {
      groups.sort((a, b) => b.totalBytes.compareTo(a.totalBytes));
    } else {
      groups.sort((a, b) => a.name.compareTo(b.name));
    }
    return groups;
  }

  int _categoryTotalBytes(String categoryId) {
    return widget.result.items
        .where((i) => i.category == categoryId)
        .fold(0, (s, i) => s + i.sizeBytes);
  }

  bool _categoryAllSelected(String categoryId) {
    final items = widget.result.items.where((i) => i.category == categoryId);
    if (items.isEmpty) return false;
    return items.every((i) => i.isSelected);
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final selectedCount = widget.result.selectedItems.length;
    final selectedBytes = widget.result.selectedBytes;

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
          // Top bar
          _TopBar(
            theme: widget.theme,
            sortOrder: _sortOrder,
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
            onSortChanged: (v) => setState(() => _sortOrder = v),
            onBack: widget.onRescan,
          ),

          // Body
          Expanded(
            child: Row(
              children: [
                // Left sidebar
                _CategorySidebar(
                  categories: _kCategories,
                  selectedId: _selectedCategoryId,
                  result: widget.result,
                  theme: widget.theme,
                  getCategoryBytes: _categoryTotalBytes,
                  isCategoryAllSelected: _categoryAllSelected,
                  onSelect: (id) => setState(() {
                    _selectedCategoryId = id;
                    _expandedGroups.clear();
                  }),
                  onToggleCategory: widget.onToggleCategory,
                ),

                // Divider
                Container(width: 1, color: Colors.white.withOpacity(0.07)),

                // Right panel
                Expanded(
                  child: _RightPanel(
                    category: _kCategories.firstWhere(
                      (c) => c.id == _selectedCategoryId,
                    ),
                    groups: _groupsForCategory(_selectedCategoryId),
                    expandedGroups: _expandedGroups,
                    theme: widget.theme,
                    allSelected: _categoryAllSelected(_selectedCategoryId),
                    onToggleExpandGroup: (name) => setState(() {
                      if (_expandedGroups.contains(name)) {
                        _expandedGroups.remove(name);
                      } else {
                        _expandedGroups.add(name);
                      }
                    }),
                    onToggleGroup: (group, selected) => widget.onToggleGroup(
                      _selectedCategoryId,
                      group,
                      selected,
                    ),
                    onToggleAll: (selected) =>
                        widget.onToggleCategory(_selectedCategoryId, selected),
                    onToggleItem: (item) {
                      final idx = widget.result.items.indexOf(item);
                      if (idx != -1) widget.onToggleItem(idx);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Footer
          _Footer(
            theme: widget.theme,
            selectedCount: selectedCount,
            selectedBytes: selectedBytes,
            isCleaning: widget.isCleaning,
            onClean: (selectedCount == 0 || widget.isCleaning)
                ? null
                : widget.onClean,
          ),
        ],
      ),
    );
  }
}

// ─── Top Bar ──────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  final SectionTheme theme;
  final _SortOrder sortOrder;
  final bool showSearch;
  final TextEditingController searchController;
  final VoidCallback onToggleSearch;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<_SortOrder> onSortChanged;
  final VoidCallback onBack;

  const _TopBar({
    required this.theme,
    required this.sortOrder,
    required this.showSearch,
    required this.searchController,
    required this.onToggleSearch,
    required this.onSearchChanged,
    required this.onSortChanged,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Back button
          TextButton.icon(
            onPressed: onBack,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white70,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text('Start Over', style: TextStyle(fontSize: 13)),
          ),

          const Spacer(),

          // Title
          const Text(
            'Cleanup Manager',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          // Search
          if (showSearch)
            SizedBox(
              width: 180,
              height: 32,
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                autofocus: true,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    color: Colors.white38,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.07),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 16,
                    color: Colors.white38,
                  ),
                ),
              ),
            ),

          const SizedBox(width: 8),

          // Search toggle
          IconButton(
            onPressed: onToggleSearch,
            icon: Icon(
              showSearch ? Icons.search_off_rounded : Icons.search_rounded,
              size: 18,
              color: showSearch ? Colors.white : Colors.white60,
            ),
            tooltip: 'Search',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),

          const SizedBox(width: 4),

          // Sort dropdown
          _SortDropdown(
            value: sortOrder,
            accentColor: theme.accentColor,
            onChanged: onSortChanged,
          ),
        ],
      ),
    );
  }
}

class _SortDropdown extends StatelessWidget {
  final _SortOrder value;
  final Color accentColor;
  final ValueChanged<_SortOrder> onChanged;

  const _SortDropdown({
    required this.value,
    required this.accentColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_SortOrder>(
      initialValue: value,
      onSelected: onChanged,
      color: const Color(0xFF1E2D1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: _SortOrder.size,
          child: Text(
            'Size',
            style: TextStyle(
              color: value == _SortOrder.size ? accentColor : Colors.white70,
              fontSize: 13,
            ),
          ),
        ),
        PopupMenuItem(
          value: _SortOrder.name,
          child: Text(
            'Name',
            style: TextStyle(
              color: value == _SortOrder.name ? accentColor : Colors.white70,
              fontSize: 13,
            ),
          ),
        ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort by: ${value == _SortOrder.size ? "Size" : "Name"}',
            style: TextStyle(
              color: accentColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: accentColor),
        ],
      ),
    );
  }
}

// ─── Left Sidebar ─────────────────────────────────────────────────────────

class _CategorySidebar extends StatelessWidget {
  final List<_CleanupCategory> categories;
  final String selectedId;
  final ScanResult result;
  final SectionTheme theme;
  final int Function(String) getCategoryBytes;
  final bool Function(String) isCategoryAllSelected;
  final ValueChanged<String> onSelect;
  final void Function(String category, bool selected) onToggleCategory;

  const _CategorySidebar({
    required this.categories,
    required this.selectedId,
    required this.result,
    required this.theme,
    required this.getCategoryBytes,
    required this.isCategoryAllSelected,
    required this.onSelect,
    required this.onToggleCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: Text(
              'System Junk',
              style: TextStyle(
                color: theme.accentColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Text(
              'Redundant files that clog up device storage and impede optimal performance.',
              style: const TextStyle(color: Colors.white38, fontSize: 11),
            ),
          ),

          // Category list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final cat = categories[i];
                final bytes = getCategoryBytes(cat.id);
                final isSelected = cat.id == selectedId;
                final allSel = isCategoryAllSelected(cat.id);
                final itemCount = result.items
                    .where((item) => item.category == cat.id)
                    .length;

                return _CategoryTile(
                  category: cat,
                  bytes: bytes,
                  itemCount: itemCount,
                  isSelected: isSelected,
                  allChecked: allSel,
                  accentColor: theme.accentColor,
                  onTap: () => onSelect(cat.id),
                  onCheck: (v) => onToggleCategory(cat.id, v ?? false),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final _CleanupCategory category;
  final int bytes;
  final int itemCount;
  final bool isSelected;
  final bool allChecked;
  final Color accentColor;
  final VoidCallback onTap;
  final ValueChanged<bool?> onCheck;

  const _CategoryTile({
    required this.category,
    required this.bytes,
    required this.itemCount,
    required this.isSelected,
    required this.allChecked,
    required this.accentColor,
    required this.onTap,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? accentColor.withOpacity(0.35)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: allChecked,
                onChanged: itemCount > 0 ? onCheck : null,
                activeColor: accentColor,
                side: const BorderSide(color: Colors.white30),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 8),
            // Icon
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: isSelected
                    ? accentColor.withOpacity(0.2)
                    : Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                category.icon,
                size: 17,
                color: isSelected ? accentColor : Colors.white54,
              ),
            ),
            const SizedBox(width: 10),
            // Name + size
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    bytes > 0 ? formatBytes(bytes) : 'No items',
                    style: TextStyle(
                      color: isSelected ? accentColor : Colors.white38,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Size badge
            if (bytes > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: isSelected
                      ? accentColor
                      : Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  formatBytes(bytes),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white60,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Right Panel ──────────────────────────────────────────────────────────

class _RightPanel extends StatelessWidget {
  final _CleanupCategory category;
  final List<_GroupEntry> groups;
  final Set<String> expandedGroups;
  final SectionTheme theme;
  final bool allSelected;
  final ValueChanged<String> onToggleExpandGroup;
  final void Function(String group, bool selected) onToggleGroup;
  final ValueChanged<bool> onToggleAll;
  final ValueChanged<FileItem> onToggleItem;

  const _RightPanel({
    required this.category,
    required this.groups,
    required this.expandedGroups,
    required this.theme,
    required this.allSelected,
    required this.onToggleExpandGroup,
    required this.onToggleGroup,
    required this.onToggleAll,
    required this.onToggleItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Panel header
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                category.description,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const SizedBox(height: 14),
              // Select row
              Row(
                children: [
                  const Text(
                    'Select: ',
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () => onToggleAll(!allSelected),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          allSelected ? 'None' : 'All',
                          style: TextStyle(
                            color: theme.accentColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                          color: theme.accentColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        Divider(color: Colors.white.withOpacity(0.07), height: 1),

        // Group list
        Expanded(
          child: groups.isEmpty
              ? Center(
                  child: Text(
                    'No items found',
                    style: const TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: groups.length,
                  itemBuilder: (context, i) {
                    final group = groups[i];
                    final isExpanded = expandedGroups.contains(group.name);
                    return _GroupTile(
                      group: group,
                      isExpanded: isExpanded,
                      theme: theme,
                      onToggleExpand: () => onToggleExpandGroup(group.name),
                      onToggleGroup: (selected) =>
                          onToggleGroup(group.name, selected),
                      onToggleItem: onToggleItem,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ─── Group Tile ───────────────────────────────────────────────────────────

class _GroupTile extends StatelessWidget {
  final _GroupEntry group;
  final bool isExpanded;
  final SectionTheme theme;
  final VoidCallback onToggleExpand;
  final ValueChanged<bool> onToggleGroup;
  final ValueChanged<FileItem> onToggleItem;

  const _GroupTile({
    required this.group,
    required this.isExpanded,
    required this.theme,
    required this.onToggleExpand,
    required this.onToggleGroup,
    required this.onToggleItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Group header row
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: group.anySelected
                ? theme.accentColor.withOpacity(0.07)
                : Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: group.anySelected
                  ? theme.accentColor.withOpacity(0.2)
                  : Colors.transparent,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onToggleExpand,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              child: Row(
                children: [
                  // Checkbox
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: group.allSelected,
                      tristate: true,
                      onChanged: (v) => onToggleGroup(v ?? group.allSelected),
                      activeColor: theme.accentColor,
                      side: const BorderSide(color: Colors.white30),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Folder icon
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.folder_rounded,
                      size: 18,
                      color: Color(0xFF64B5F6),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Name
                  Expanded(
                    child: Text(
                      group.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Sparkle icon
                  Icon(
                    Icons.auto_awesome_rounded,
                    size: 14,
                    color: theme.accentColor.withOpacity(0.6),
                  ),
                  const SizedBox(width: 8),

                  // Size
                  Text(
                    group.formattedSize,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Expand chevron
                  AnimatedRotation(
                    turns: isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 18,
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Expanded file list
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 44),
            child: Column(
              children: group.items.map((item) {
                return _FileTile(
                  item: item,
                  accentColor: theme.accentColor,
                  onToggle: () => onToggleItem(item),
                  onOpen: () => revealFileOrFolder(item.path),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

// ─── File Tile ────────────────────────────────────────────────────────────

class _FileTile extends StatelessWidget {
  final FileItem item;
  final Color accentColor;
  final VoidCallback onToggle;
  final VoidCallback? onOpen;

  const _FileTile({
    required this.item,
    required this.accentColor,
    required this.onToggle,
    this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: item.isSelected
            ? accentColor.withOpacity(0.06)
            : Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onToggle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: Checkbox(
                  value: item.isSelected,
                  onChanged: (_) => onToggle(),
                  activeColor: accentColor,
                  side: const BorderSide(color: Colors.white24),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.insert_drive_file_outlined,
                size: 15,
                color: Colors.white38,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                item.formattedSize,
                style: TextStyle(
                  color: accentColor.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (onOpen != null) ...[
                const SizedBox(width: 4),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    icon: Icon(
                      Icons.open_in_new_rounded,
                      size: 12,
                      color: Colors.white54,
                    ),
                    onPressed: onOpen,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  final SectionTheme theme;
  final int selectedCount;
  final int selectedBytes;
  final bool isCleaning;
  final VoidCallback? onClean;

  const _Footer({
    required this.theme,
    required this.selectedCount,
    required this.selectedBytes,
    required this.isCleaning,
    required this.onClean,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.07))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Summary
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: Colors.white70),
              children: [
                TextSpan(
                  text: '$selectedCount Items Selected',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const TextSpan(text: '  |  '),
                TextSpan(
                  text: formatBytes(selectedBytes),
                  style: TextStyle(
                    color: theme.accentColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Clean Up button
          AnimatedOpacity(
            opacity: onClean != null ? 1.0 : 0.4,
            duration: const Duration(milliseconds: 200),
            child: ElevatedButton(
              onPressed: onClean,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: isCleaning
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Clean Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
