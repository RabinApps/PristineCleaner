import 'package:flutter/material.dart';

import 'project_directory_selector.dart';
import '../../core/models/my_tool.dart';
import '../../providers/my_tools_provider.dart';

class MyToolCard extends StatefulWidget {
  final MyTool tool;
  final bool isRunning;
  final ToolScanSummary? summary;
  final String? selectedDirectory;
  final VoidCallback? onPickDirectory;
  final VoidCallback onScan;

  const MyToolCard({
    super.key,
    required this.tool,
    required this.isRunning,
    required this.summary,
    this.selectedDirectory,
    this.onPickDirectory,
    required this.onScan,
  });

  @override
  State<MyToolCard> createState() => _MyToolCardState();
}

class _MyToolCardState extends State<MyToolCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final border = widget.tool.accentColor.withValues(
      alpha: _hovered ? 0.45 : 0.22,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border, width: 1),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF6D5A95).withValues(alpha: 0.32),
              const Color(0xFF57417E).withValues(alpha: 0.18),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF120920,
              ).withValues(alpha: _hovered ? 0.5 : 0.3),
              blurRadius: _hovered ? 22 : 14,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IconBadge(tool: widget.tool),
                const Spacer(),
                if (widget.tool.showStar)
                  Icon(
                    Icons.star_border_rounded,
                    size: 18,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              widget.tool.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.04,
                letterSpacing: -0.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.tool.description,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontSize: 12,
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.summary != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.summary!.subtitle,
                style: TextStyle(
                  color: widget.tool.accentColor.withValues(alpha: 0.92),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child:
                      widget.onPickDirectory != null &&
                          widget.selectedDirectory != null
                      ? ProjectDirectorySelector(
                          selectedPath: widget.selectedDirectory!,
                          accentColor: widget.tool.accentColor,
                          menuColor: const Color(0xFF3C275B),
                          onPickFolder: widget.onPickDirectory!,
                          chooseFolderLabel: 'Choose Folder...',
                        )
                      : _LocationPill(label: widget.tool.locationLabel),
                ),
                const SizedBox(width: 12),
                _ScanButton(
                  onTap: widget.isRunning ? null : widget.onScan,
                  isRunning: widget.isRunning,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final MyTool tool;

  const _IconBadge({required this.tool});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tool.accentColor.withValues(alpha: 0.95),
            tool.accentColor.withValues(alpha: 0.55),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: tool.accentColor.withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(tool.icon, color: Colors.white, size: 24),
    );
  }
}

class _LocationPill extends StatelessWidget {
  final String? label;

  const _LocationPill({required this.label});

  @override
  Widget build(BuildContext context) {
    if (label == null || label!.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.folder_outlined,
            size: 13,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.72),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isRunning;

  const _ScanButton({required this.onTap, required this.isRunning});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.93),
            borderRadius: BorderRadius.circular(10),
          ),
          child: isRunning
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF2C2145),
                    ),
                  ),
                )
              : const Text(
                  'Scan',
                  style: TextStyle(
                    color: Color(0xFF2C2145),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}
