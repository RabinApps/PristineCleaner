import 'package:flutter/material.dart';

import '../../core/models/file_item.dart';
import '../../core/models/removal_models.dart';
import '../../services/trash_service.dart';
import '../widgets/removal_screen.dart';

Future<RemovalOutcome?> runTrashRemovalFlow({
  required BuildContext context,
  required String title,
  required Color accentColor,
  required List<FileItem> selectedItems,
  required TrashService trashService,
  bool permanent = false,
}) {
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
