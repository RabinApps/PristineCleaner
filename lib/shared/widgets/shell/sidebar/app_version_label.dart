import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionLabel extends StatefulWidget {
  const AppVersionLabel({super.key});

  @override
  State<AppVersionLabel> createState() => _AppVersionLabelState();
}

class _AppVersionLabelState extends State<AppVersionLabel> {
  late final Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        final versionText = _buildVersionText(snapshot.data);

        return Text(
          versionText,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.2),
            fontSize: 11,
          ),
        );
      },
    );
  }

  String _buildVersionText(PackageInfo? packageInfo) {
    if (packageInfo == null || packageInfo.version.isEmpty) {
      return 'v-';
    }

    final buildNumber = packageInfo.buildNumber;
    if (buildNumber.isEmpty) {
      return 'v${packageInfo.version}';
    }

    return 'v${packageInfo.version}+${packageInfo.buildNumber}';
  }
}
