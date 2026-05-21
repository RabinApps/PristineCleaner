import 'package:flutter/material.dart';
import '../theme/section_themes.dart';

enum NavSection {
  smartCare,
  cleanup,
  myClutter,
  spaceLens,
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

  static const List<NavItem> mainItems = [
    NavItem(
      section: NavSection.smartCare,
      label: 'Smart Care',
      icon: Icons.favorite_rounded,
      theme: SectionThemes.smartCare,
    ),
    NavItem(
      section: NavSection.cleanup,
      label: 'Cleanup',
      icon: Icons.cleaning_services_rounded,
      theme: SectionThemes.cleanup,
    ),
    NavItem(
      section: NavSection.myClutter,
      label: 'My Clutter',
      icon: Icons.folder_outlined,
      theme: SectionThemes.myClutter,
    ),
    NavItem(
      section: NavSection.spaceLens,
      label: 'Space Lens',
      icon: Icons.lens_blur_rounded,
      theme: SectionThemes.spaceLens,
    ),
    NavItem(
      section: NavSection.applications,
      label: 'Applications',
      icon: Icons.apps_rounded,
      theme: SectionThemes.applications,
    ),
  ];

  static const List<NavItem> bottomItems = [
    NavItem(
      section: NavSection.myTools,
      label: 'My Tools',
      icon: Icons.build_outlined,
    ),
    NavItem(
      section: NavSection.myActivity,
      label: 'My Activity',
      icon: Icons.bar_chart_rounded,
    ),
  ];
}
