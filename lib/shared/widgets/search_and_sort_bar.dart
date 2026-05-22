import 'package:flutter/material.dart';
import '../../gen/strings.g.dart';

/// Sort order enum for generic use across all pages
enum SortBy { size, name, ascending, descending }

extension SortByLabel on SortBy {
  String label(BuildContext context) {
    return switch (this) {
      SortBy.size => context.t.searchAndSort.size,
      SortBy.name => context.t.searchAndSort.name,
      SortBy.ascending => context.t.searchAndSort.ascending,
      SortBy.descending => context.t.searchAndSort.descending,
    };
  }
}

/// Reusable search and sort bar component for all pages
class SearchAndSortBar extends StatelessWidget {
  final Color accentColor;
  final bool showSearch;
  final TextEditingController searchController;
  final VoidCallback onToggleSearch;
  final ValueChanged<String> onSearchChanged;
  final SortBy sortBy;
  final ValueChanged<SortBy> onSortChanged;
  final List<SortBy> sortOptions;

  const SearchAndSortBar({
    super.key,
    required this.accentColor,
    required this.showSearch,
    required this.searchController,
    required this.onToggleSearch,
    required this.onSearchChanged,
    required this.sortBy,
    required this.onSortChanged,
    this.sortOptions = const [SortBy.size, SortBy.name],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                hintText: context.t.searchAndSort.searchHint,
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.07),
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
          tooltip: context.t.tooltips.search,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),

        const SizedBox(width: 4),

        // Sort dropdown
        PopupMenuButton<SortBy>(
          initialValue: sortBy,
          onSelected: onSortChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          itemBuilder: (_) => [
            for (final option in sortOptions)
              PopupMenuItem(
                value: option,
                child: Text(
                  option.label(context),
                  style: TextStyle(
                    color: sortBy == option ? accentColor : Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${context.t.searchAndSort.sortBy}: ${sortBy.label(context)}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.expand_more_rounded,
                  size: 16,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
