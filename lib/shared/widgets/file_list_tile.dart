import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/models/file_item.dart';

class FileListTile extends StatelessWidget {
  final FileItem item;
  final Color accentColor;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onOpen;

  const FileListTile({
    super.key,
    required this.item,
    required this.accentColor,
    required this.onChanged,
    this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final lastUsed = item.lastUsed;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: item.isSelected
            ? accentColor.withOpacity(0.08)
            : Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: item.isSelected
              ? accentColor.withOpacity(0.3)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onChanged(!item.isSelected),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Checkbox(
                value: item.isSelected,
                onChanged: onChanged,
                activeColor: accentColor,
                side: BorderSide(color: Colors.white30),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              const SizedBox(width: 8),
              _ItemIcon(item: item),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (lastUsed == null) ...[
                      const SizedBox(height: 2),
                      Text(
                        item.path,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (lastUsed != null)
                    Text(
                      _formatDate(lastUsed),
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(width: 10),
                  Text(
                    item.formattedSize,
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Open file button
                  if (onOpen != null)
                    Tooltip(
                      message: 'Open in Finder',
                      child: IconButton(
                        icon: Icon(
                          Icons.open_in_new_rounded,
                          size: 16,
                          color: Colors.white54,
                        ),
                        onPressed: onOpen,
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
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemIcon extends StatelessWidget {
  final FileItem item;

  const _ItemIcon({required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.iconPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.file(
          File(item.iconPath!),
          width: 35,
          height: 35,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _FallbackIcon(item: item),
        ),
      );
    }

    return _FallbackIcon(item: item);
  }
}

class _FallbackIcon extends StatelessWidget {
  final FileItem item;
  const _FallbackIcon({required this.item});

  @override
  Widget build(BuildContext context) {
    return Icon(
      item.isDirectory ? Icons.folder_rounded : Icons.insert_drive_file_rounded,
      size: 30,
      color: item.isDirectory ? Colors.amber.shade400 : Colors.white38,
    );
  }
}

String _formatDate(DateTime value) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final month = months[value.month - 1];
  return '$month ${value.day}, ${value.year}';
}
