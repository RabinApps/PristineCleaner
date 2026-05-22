import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';

class ProjectDirectorySelector extends StatelessWidget {
  final String selectedPath;
  final Color accentColor;
  final Color menuColor;
  final VoidCallback onPickFolder;
  final String? chooseFolderLabel;

  const ProjectDirectorySelector({
    super.key,
    required this.selectedPath,
    required this.accentColor,
    this.menuColor = const Color(0xFF123A39),
    required this.onPickFolder,
    this.chooseFolderLabel,
  });

  @override
  Widget build(BuildContext context) {
    final shortLabel = pathLabel(selectedPath);
    final label = chooseFolderLabel ?? context.t.projectDirectory.chooseFolder;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'choose_folder') {
            onPickFolder();
          }
        },
        color: menuColor,
        itemBuilder: (context) => [
          PopupMenuItem<String>(
            value: 'current',
            enabled: false,
            child: Row(
              children: [
                Icon(Icons.folder_rounded, color: accentColor, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    shortLabel,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(height: 8),
          PopupMenuItem<String>(
            value: 'choose_folder',
            child: Row(
              children: [
                const Icon(Icons.create_new_folder_outlined, size: 16),
                const SizedBox(width: 8),
                Text(label),
              ],
            ),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.folder_open_rounded, color: accentColor, size: 18),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 240),
              child: Text(
                shortLabel,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white.withValues(alpha: 0.75),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

String pathLabel(String path) {
  if (path == '/' || path == '\\' || path.endsWith(':\\')) {
    return path;
  }

  final normalized = path.replaceAll('\\', '/');
  final parts = normalized.split('/').where((p) => p.isNotEmpty).toList();
  return parts.isEmpty ? path : parts.last;
}
