import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
import '../../core/models/file_item.dart';
import '../../core/models/removal_models.dart';
import '../../core/utils/format_utils.dart';

typedef RemovalRunner =
    Future<RemovalOutcome> Function(
      RemovalCancellationToken token,
      void Function(RemovalProgress progress) onProgress,
    );

Future<RemovalOutcome?> showRemovalScreen({
  required BuildContext context,
  required String title,
  required Color accentColor,
  required List<FileItem> selectedItems,
  required RemovalRunner runRemoval,
}) {
  return showGeneralDialog<RemovalOutcome>(
    context: context,
    barrierDismissible: false,
    barrierLabel: context.t.removal.barrierLabel,
    barrierColor: Colors.black.withValues(alpha: 0.72),
    pageBuilder: (_, _, _) {
      return _RemovalScreen(
        title: title,
        accentColor: accentColor,
        selectedItems: selectedItems,
        runRemoval: runRemoval,
      );
    },
  );
}

class _RemovalScreen extends StatefulWidget {
  final String title;
  final Color accentColor;
  final List<FileItem> selectedItems;
  final RemovalRunner runRemoval;

  const _RemovalScreen({
    required this.title,
    required this.accentColor,
    required this.selectedItems,
    required this.runRemoval,
  });

  @override
  State<_RemovalScreen> createState() => _RemovalScreenState();
}

class _RemovalScreenState extends State<_RemovalScreen> {
  final RemovalCancellationToken _token = RemovalCancellationToken();
  RemovalProgress _progress = const RemovalProgress(
    processedItems: 0,
    totalItems: 0,
    deletedItems: 0,
    deletedBytes: 0,
  );
  RemovalOutcome? _outcome;
  String? _error;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startRemoval();
    });
  }

  Future<void> _startRemoval() async {
    setState(() {
      _progress = RemovalProgress(
        processedItems: 0,
        totalItems: widget.selectedItems.length,
        deletedItems: 0,
        deletedBytes: 0,
      );
    });

    try {
      final outcome = await widget.runRemoval(_token, _handleProgress);
      if (!mounted) return;
      setState(() {
        _outcome = outcome;
        _isRunning = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isRunning = false;
      });
    }
  }

  void _handleProgress(RemovalProgress progress) {
    if (!mounted) return;
    setState(() {
      _progress = progress;
    });
  }

  Future<void> _requestStop() async {
    final shouldStop =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              backgroundColor: const Color(0xFF191919),
              title: Text(
                context.t.dialogs.stopRemovalTitle,
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                context.t.dialogs.stopRemovalMessage,
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: Text(context.t.buttons.keepRemoving),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text(context.t.buttons.stop),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!shouldStop) return;
    setState(() {
      _token.requestStop();
      _progress = RemovalProgress(
        processedItems: _progress.processedItems,
        totalItems: _progress.totalItems,
        deletedItems: _progress.deletedItems,
        deletedBytes: _progress.deletedBytes,
        currentItemName: _progress.currentItemName,
        stopRequested: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isRunning,
      child: Material(
        color: const Color(0xFF101217),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 20, 26, 24),
            child: _isRunning
                ? _RunningView(
                    title: widget.title,
                    accentColor: widget.accentColor,
                    progress: _progress,
                    onStop: _requestStop,
                  )
                : _CompletedView(
                    title: widget.title,
                    accentColor: widget.accentColor,
                    outcome: _outcome,
                    error: _error,
                    onClose: () => Navigator.of(context).pop(_outcome),
                  ),
          ),
        ),
      ),
    );
  }
}

class _RunningView extends StatelessWidget {
  final String title;
  final Color accentColor;
  final RemovalProgress progress;
  final VoidCallback onStop;

  const _RunningView({
    required this.title,
    required this.accentColor,
    required this.progress,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = progress.totalItems;
    final processed = progress.processedItems;
    final progressLabel = totalItems <= 0
        ? context.t.removal.preparing
        : context.t.removal.processedSummary
              .replaceAll('{processed}', '$processed')
              .replaceAll('{total}', '$totalItems');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.removal.removingFrom.replaceAll('{title}', title),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          progress.stopRequested
              ? context.t.removal.stoppingAfterCurrentFile
              : context.t.removal.keepWindowOpen,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: totalItems == 0 ? null : progress.fraction,
            minHeight: 12,
            backgroundColor: Colors.white10,
            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          progressLabel,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 6),
        Text(
          context.t.removal.deletedFreed
              .replaceAll('{deleted}', '${progress.deletedItems}')
              .replaceAll('{bytes}', formatBytes(progress.deletedBytes)),
          style: TextStyle(
            color: accentColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (progress.currentItemName != null) ...[
          const SizedBox(height: 12),
          Text(
            context.t.removal.currentItem.replaceAll(
              '{name}',
              progress.currentItemName ?? '',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
        const Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: progress.stopRequested ? null : onStop,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: progress.stopRequested
                  ? Colors.white24
                  : Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            ),
            icon: const Icon(Icons.stop_rounded),
            label: Text(
              progress.stopRequested
                  ? context.t.removal.stopping
                  : context.t.buttons.stop,
            ),
          ),
        ),
      ],
    );
  }
}

class _CompletedView extends StatelessWidget {
  final String title;
  final Color accentColor;
  final RemovalOutcome? outcome;
  final String? error;
  final VoidCallback onClose;

  const _CompletedView({
    required this.title,
    required this.accentColor,
    required this.outcome,
    required this.error,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final data = outcome;
    if (data == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.removal.removalFailed,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            error ?? context.t.removal.removalFailedDetails,
            style: const TextStyle(color: Colors.white70),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: onClose,
              child: Text(context.t.buttons.close),
            ),
          ),
        ],
      );
    }

    final heading = data.stoppedByUser
        ? context.t.removal.removalStopped
        : context.t.removal.removalComplete;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          context.t.removal.deletedSummary
              .replaceAll('{title}', title)
              .replaceAll('{count}', '${data.deletedCount}'),
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          context.t.removal.freedSummary.replaceAll(
            '{bytes}',
            formatBytes(data.deletedBytes),
          ),
          style: TextStyle(
            color: accentColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (data.errors.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            context.t.removal.failedToRemoveSummary.replaceAll(
              '{count}',
              '${data.errors.length}',
            ),
            style: const TextStyle(color: Colors.orangeAccent, fontSize: 13),
          ),
        ],
        const SizedBox(height: 16),
        Text(
          context.t.removal.deletedFiles,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: data.deletedItems.isEmpty
                ? Center(
                    child: Text(
                      context.t.removal.noFilesDeleted,
                      style: const TextStyle(color: Colors.white54),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: data.deletedItems.length,
                    separatorBuilder: (_, _) => Divider(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    itemBuilder: (context, index) {
                      final item = data.deletedItems[index];
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        title: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        subtitle: Text(
                          item.path,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                          ),
                        ),
                        trailing: Text(
                          formatBytes(item.sizeBytes),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            onPressed: onClose,
            style: FilledButton.styleFrom(
              backgroundColor: accentColor,
              foregroundColor: Colors.black,
            ),
            child: Text(context.t.buttons.done),
          ),
        ),
      ],
    );
  }
}
