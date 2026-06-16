import 'package:flutter/material.dart';

import '../../core/models/file_item.dart';
import '../../core/models/removal_models.dart';
import '../../gen/strings.g.dart';
import '../../services/trash_service.dart';
import '../widgets/removal_screen.dart';

Future<RemovalOutcome?> runTrashRemovalFlow({
  required BuildContext context,
  required String title,
  required Color accentColor,
  required List<FileItem> selectedItems,
  required TrashService trashService,
  bool permanent = false,
  bool requireConfirmation = false,
}) async {
  if (requireConfirmation) {
    final confirmed = await _confirmRemoval(
      context: context,
      count: selectedItems.length,
      accentColor: accentColor,
      permanent: permanent,
    );
    if (confirmed != true || !context.mounted) {
      return null;
    }
  }

  return showRemovalScreen(
    context: context,
    title: title,
    accentColor: accentColor,
    selectedItems: selectedItems,
    runRemoval: (token, onProgress) {
      return trashService.deleteItemsTracked(
        selectedItems,
        permanent: permanent,
        cancellationToken: token,
        onProgress: onProgress,
      );
    },
  );
}

Future<bool?> _confirmRemoval({
  required BuildContext context,
  required int count,
  required Color accentColor,
  required bool permanent,
}) {
  final tx = context.t.dialogs;
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(tx.confirmRemovalTitle),
        content: Text(
          (permanent
                  ? tx.confirmRemovalMessagePermanent
                  : tx.confirmRemovalMessage)
              .replaceAll('{count}', count.toString()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tx.confirmRemovalCancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: accentColor),
            child: Text(
              tx.confirmRemovalConfirm,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
