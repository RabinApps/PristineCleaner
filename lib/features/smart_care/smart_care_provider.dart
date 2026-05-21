import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/scan_result.dart';
import '../../core/services/file_service.dart';

final smartCareProvider = AsyncNotifierProvider<SmartCareNotifier, DiskInfo>(
  SmartCareNotifier.new,
);

class SmartCareNotifier extends AsyncNotifier<DiskInfo> {
  @override
  Future<DiskInfo> build() async {
    return ref.read(fileServiceProvider).getDiskInfo();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(fileServiceProvider).getDiskInfo(),
    );
  }
}
