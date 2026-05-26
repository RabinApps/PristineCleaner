import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/scan_result.dart';
import '../services/file_service.dart';

final homeProvider = AsyncNotifierProvider<HomeNotifier, HomeDashboardData>(
  HomeNotifier.new,
);

class HomeNotifier extends AsyncNotifier<HomeDashboardData> {
  Timer? _refreshTimer;

  @override
  Future<HomeDashboardData> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    final data = await _loadHomeData();
    _startAutoRefresh();
    return data;
  }

  Future<void> refresh() async {
    _refreshTimer?.cancel();
    state = await AsyncValue.guard(() => _loadHomeData());
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      final next = await _loadHomeData();
      state = AsyncValue.data(next);
    });
  }

  Future<HomeDashboardData> _loadHomeData() async {
    final service = ref.read(fileServiceProvider);
    final disk = await service.getDiskInfo();

    SystemUsage usage;
    String? error;
    try {
      usage = await service.getSystemUsage();
    } catch (e) {
      usage = const SystemUsage.unavailable();
      error = e.toString();
    }

    return HomeDashboardData(
      diskInfo: disk,
      systemUsage: usage,
      systemError: error,
      updatedAt: DateTime.now(),
    );
  }
}
