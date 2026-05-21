import 'file_item.dart';

class RemovalCancellationToken {
  bool _isStopRequested = false;

  bool get isStopRequested => _isStopRequested;

  void requestStop() {
    _isStopRequested = true;
  }
}

class RemovalProgress {
  final int processedItems;
  final int totalItems;
  final int deletedItems;
  final int deletedBytes;
  final String? currentItemName;
  final bool stopRequested;

  const RemovalProgress({
    required this.processedItems,
    required this.totalItems,
    required this.deletedItems,
    required this.deletedBytes,
    this.currentItemName,
    this.stopRequested = false,
  });

  double get fraction {
    if (totalItems <= 0) return 0;
    return (processedItems / totalItems).clamp(0.0, 1.0);
  }

  int get remainingItems {
    final remaining = totalItems - processedItems;
    return remaining < 0 ? 0 : remaining;
  }
}

class RemovalOutcome {
  final List<FileItem> deletedItems;
  final int deletedBytes;
  final List<String> errors;
  final bool stoppedByUser;

  const RemovalOutcome({
    required this.deletedItems,
    required this.deletedBytes,
    this.errors = const <String>[],
    this.stoppedByUser = false,
  });

  int get deletedCount => deletedItems.length;
}
