import 'package:flutter/material.dart';

enum MyToolScanType {
  downloads,
  largeAndOldFiles,
  duplicateFinder,
  similarImages,
  appLeftovers,
  systemJunk,
  loginItems,
  backgroundItems,
  trashBins,
  applicationPermissions,
  timeMachineSnapshots,
  mailAttachments,
  malwareFinder,
}

class MyTool {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final String? locationLabel;
  final bool showStar;
  final MyToolScanType scanType;

  const MyTool({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.scanType,
    this.locationLabel,
    this.showStar = false,
  });
}
