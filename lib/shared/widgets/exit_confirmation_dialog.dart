import 'package:flutter/material.dart';
import '../../gen/strings.g.dart';

/// Simple confirmation dialog shown when user attempts to quit while scanning.
/// Returns `true` to allow quit, `false` to cancel.
class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.exitConfirmationTitle),
      content: Text(t.dialogs.exitConfirmationMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(t.dialogs.exitConfirmationWait),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text(
            t.dialogs.exitConfirmationQuit,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
