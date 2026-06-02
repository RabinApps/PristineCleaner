import 'package:flutter/foundation.dart';

/// A small global manager to track active scans across the app.
class ScanManager {
  ScanManager._private();
  static final ScanManager instance = ScanManager._private();

  final ValueNotifier<bool> isScanning = ValueNotifier<bool>(false);
  final Set<String> _activeScans = {};

  void registerScan(String id) {
    _activeScans.add(id);
    _update();
  }

  void unregisterScan(String id) {
    _activeScans.remove(id);
    _update();
  }

  void _update() {
    isScanning.value = _activeScans.isNotEmpty;
  }

  void dispose() {
    isScanning.dispose();
  }
}
