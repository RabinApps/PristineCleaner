import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
import '../theme/section_themes.dart';

enum NavSection {
  smartCare,
  cleanup,
  myClutter,
  spaceView,
  applications,
  myTools,
  myActivity,
}

class NavItem {
  final NavSection section;
  final String label;
  final IconData icon;
  final SectionTheme? theme;

  const NavItem({
    required this.section,
    required this.label,
    required this.icon,
    this.theme,
  });

  static List<NavItem> mainItems() => [
    NavItem(
      section: NavSection.smartCare,
      label: t.navigation.smartCare,
      icon: Icons.favorite_rounded,
      theme: SectionThemes.smartCare,
    ),
    NavItem(
      section: NavSection.cleanup,
      label: t.navigation.cleanup,
      icon: Icons.cleaning_services_rounded,
      theme: SectionThemes.cleanup,
    ),
    NavItem(
      section: NavSection.myClutter,
      label: t.navigation.myClutter,
      icon: Icons.folder_outlined,
      theme: SectionThemes.myClutter,
    ),
    NavItem(
      section: NavSection.spaceView,
      label: t.navigation.spaceView,
      icon: Icons.lens_blur_rounded,
      theme: SectionThemes.spaceView,
    ),
    NavItem(
      section: NavSection.applications,
      label: t.navigation.applications,
      icon: Icons.apps_rounded,
      theme: SectionThemes.applications,
    ),
  ];

  static List<NavItem> bottomItems() => [
    NavItem(
      section: NavSection.myTools,
      label: t.navigation.myTools,
      icon: Icons.build_outlined,
      theme: SectionThemes.myTools,
    ),
    NavItem(
      section: NavSection.myActivity,
      label: t.navigation.myActivity,
      icon: Icons.bar_chart_rounded,
    ),
  ];
}
