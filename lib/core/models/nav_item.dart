import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
import '../theme/section_themes.dart';

enum NavSection {
  home,
  cleanup,
  myClutter,
  spaceView,
  applications,
  myTools,
  donate,
  settings,
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
      section: NavSection.home,
      label: t.navigation.home,
      icon: Icons.home,
      theme: SectionThemes.home,
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
    NavItem(
      section: NavSection.myTools,
      label: t.navigation.myTools,
      icon: Icons.build_outlined,
      theme: SectionThemes.myTools,
    ),
  ];

  static NavItem donateItem() => NavItem(
    section: NavSection.donate,
    label: t.navigation.donate,
    icon: Icons.volunteer_activism_rounded,
    theme: SectionThemes.home,
  );

  static NavItem settingsItem() => NavItem(
    section: NavSection.settings,
    label: t.navigation.settings,
    icon: Icons.settings_rounded,
    theme: SectionThemes.settings,
  );
}
