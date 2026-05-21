import 'package:flutter/material.dart';

import '../../core/theme/section_themes.dart';
import 'glossy_icon_widget.dart';
import 'scan_button.dart';

class SectionLandingLayout extends StatelessWidget {
  final SectionTheme theme;
  final OrbShape orbShape;
  final VoidCallback? onScan;
  final VoidCallback? onStop;
  final bool isScanning;
  final Widget? extraContent;
  final double? progressPercent;

  const SectionLandingLayout({
    super.key,
    required this.theme,
    this.progressPercent,
    this.orbShape = OrbShape.circle,
    this.onScan,
    this.onStop,
    this.isScanning = false,
    this.extraContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Stack(
        children: [
          // Main content row (orb + text)
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 3‑D glossy orb
                  GlossyIconWidget(
                    baseColor: theme.orbColor,
                    icon: theme.icon,
                    size: 258,
                    shape: orbShape,
                  ),

                  const SizedBox(width: 60),

                  // Section info column
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theme.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        theme.subtitle,
                        style: const TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ...theme.features.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _FeatureRow(
                            feature: f,
                            accentColor: theme.accentColor,
                          ),
                        ),
                      ),
                      if (extraContent != null) ...[
                        const SizedBox(height: 16),
                        extraContent!,
                      ],
                      if (isScanning && progressPercent != null) ...[
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: LinearProgressIndicator(
                              value: progressPercent!.clamp(0.0, 1.0),
                              minHeight: 8,
                              backgroundColor: Colors.white12,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.accentColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Scan button pinned at bottom center
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Center(
              child: ScanButton(
                color: isScanning ? Colors.redAccent : theme.accentColor,
                label: isScanning ? 'Stop' : 'Scan',
                isLoading: false,
                onPressed: isScanning
                    ? (onStop == null
                          ? null
                          : () async {
                              final shouldStop =
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        backgroundColor: const Color(
                                          0xFF191919,
                                        ),
                                        title: const Text(
                                          'Stop scanning?',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        content: const Text(
                                          'This will cancel the current scan and discard any partial progress.',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              dialogContext,
                                            ).pop(false),
                                            child: const Text('Keep scanning'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () => Navigator.of(
                                              dialogContext,
                                            ).pop(true),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: const Text('Stop'),
                                          ),
                                        ],
                                      );
                                    },
                                  ) ??
                                  false;
                              if (shouldStop) {
                                onStop?.call();
                              }
                            })
                    : onScan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final SectionFeature feature;
  final Color accentColor;

  const _FeatureRow({required this.feature, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accentColor.withOpacity(0.18),
            border: Border.all(color: accentColor.withOpacity(0.35), width: 1),
          ),
          child: Icon(feature.icon, size: 15, color: accentColor),
        ),
        const SizedBox(width: 12),
        Text(
          feature.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
