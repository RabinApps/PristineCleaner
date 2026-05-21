import 'package:flutter/material.dart';

class SectionFeature {
  final String label;
  final IconData icon;
  const SectionFeature({required this.label, required this.icon});
}

class SectionTheme {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<SectionFeature> features;
  final List<Color> backgroundGradient;
  final Color accentColor;
  final Color orbColor;

  const SectionTheme({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.features,
    required this.backgroundGradient,
    required this.accentColor,
    required this.orbColor,
  });
}

class SectionThemes {
  SectionThemes._();

  static const smartCare = SectionTheme(
    id: 'smart_care',
    title: 'Smart Care',
    subtitle: 'Get a complete health overview\nof your system in one click.',
    icon: Icons.favorite_rounded,
    features: [
      SectionFeature(
        label: 'System Status',
        icon: Icons.monitor_heart_outlined,
      ),
      SectionFeature(label: 'Storage Usage', icon: Icons.storage_outlined),
      SectionFeature(label: 'Quick Actions', icon: Icons.bolt_outlined),
    ],
    backgroundGradient: [
      Color(0xFF173020),
      Color(0xFF0C1E13),
      Color(0xFF060D08),
    ],
    accentColor: Color(0xFF66BB6A),
    orbColor: Color(0xFF2E7D32),
  );

  static const cleanup = SectionTheme(
    id: 'cleanup',
    title: 'Junk Cleanup',
    subtitle:
        'Clean your system to achieve maximum\nperformance and reclaim more free space.',
    icon: Icons.cleaning_services_rounded,
    features: [
      SectionFeature(label: 'System Junk', icon: Icons.delete_outline_rounded),
      SectionFeature(label: 'User Cache', icon: Icons.folder_off_outlined),
      SectionFeature(label: 'Temp Files', icon: Icons.description_outlined),
    ],
    backgroundGradient: [
      Color(0xFF1A3A1A),
      Color(0xFF0D2010),
      Color(0xFF060D08),
    ],
    accentColor: Color(0xFF4CAF50),
    orbColor: Color(0xFF1B5E20),
  );

  static const myClutter = SectionTheme(
    id: 'my_clutter',
    title: 'My Clutter',
    subtitle:
        'Sort through your files and reduce\nthe mess in just a few clicks.',
    icon: Icons.folder_outlined,
    features: [
      SectionFeature(label: 'Large Files', icon: Icons.file_open_outlined),
      SectionFeature(label: 'Duplicates', icon: Icons.copy_outlined),
      SectionFeature(
        label: 'Large Similar Images',
        icon: Icons.image_search_outlined,
      ),
    ],
    backgroundGradient: [
      Color(0xFF0D3330),
      Color(0xFF07201E),
      Color(0xFF030E0D),
    ],
    accentColor: Color(0xFF26A69A),
    orbColor: Color(0xFF004D45),
  );

  static const spaceLens = SectionTheme(
    id: 'space_lens',
    title: 'Space Lens',
    subtitle:
        "Visualize what's taking up the most\ndisk space and clean up quickly.",
    icon: Icons.lens_blur_rounded,
    features: [
      SectionFeature(
        label: 'Visual Storage Map',
        icon: Icons.grid_view_outlined,
      ),
      SectionFeature(
        label: 'Large Folders Overview',
        icon: Icons.folder_zip_outlined,
      ),
      SectionFeature(
        label: 'Hidden Files Uncovered',
        icon: Icons.visibility_off_outlined,
      ),
    ],
    backgroundGradient: [
      Color(0xFF1E0A40),
      Color(0xFF110528),
      Color(0xFF080016),
    ],
    accentColor: Color(0xFF7C4DFF),
    orbColor: Color(0xFF311B92),
  );

  static const applications = SectionTheme(
    id: 'applications',
    title: 'Applications',
    subtitle:
        'Take control of your applications.\nUninstall or remove old leftovers.',
    icon: Icons.apps_rounded,
    features: [
      SectionFeature(
        label: 'App Uninstaller',
        icon: Icons.delete_sweep_outlined,
      ),
      SectionFeature(label: 'Large Apps', icon: Icons.storage_outlined),
      SectionFeature(
        label: 'File Leftovers',
        icon: Icons.folder_delete_outlined,
      ),
    ],
    backgroundGradient: [
      Color(0xFF0D1B3E),
      Color(0xFF07102A),
      Color(0xFF030816),
    ],
    accentColor: Color(0xFF42A5F5),
    orbColor: Color(0xFF0D47A1),
  );

  static const all = [smartCare, cleanup, myClutter, spaceLens, applications];
}
