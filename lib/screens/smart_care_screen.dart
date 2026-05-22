import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/scan_result.dart';
import '../gen/strings.g.dart';
import '../core/theme/section_themes.dart';
import '../shared/widgets/glossy_icon_widget.dart';
import '../shared/widgets/scan_button.dart';
import '../providers/smart_care_provider.dart';

class SmartCareScreen extends ConsumerWidget {
  const SmartCareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diskAsync = ref.watch(smartCareProvider);
    final theme = SectionThemes.smartCareLocalized(context);

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
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left: orb + disk ring
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GlossyIconWidget(
                        baseColor: theme.orbColor,
                        icon: theme.icon,
                        size: 240,
                      ),
                      const SizedBox(height: 20),
                      diskAsync.when(
                        data: (info) => _DiskRing(
                          info: info,
                          accentColor: theme.accentColor,
                        ),
                        loading: () => const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            color: Color(0xFF66BB6A),
                            strokeWidth: 3,
                          ),
                        ),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                    ],
                  ),

                  const SizedBox(width: 60),

                  // Right: info column
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theme.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        theme.subtitle,
                        style: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 28),
                      diskAsync.when(
                        data: (info) => _DiskStats(
                          info: info,
                          accentColor: theme.accentColor,
                        ),
                        loading: () => const CircularProgressIndicator(
                          color: Color(0xFF66BB6A),
                        ),
                        error: (e, _) => Text(
                          context.t.smartCare.unableToReadDiskInfo,
                          style: TextStyle(color: Colors.red.shade300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Scan / Refresh button
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Center(
              child: ScanButton(
                color: theme.accentColor,
                label: context.t.smartCare.refresh,
                isLoading: diskAsync.isLoading,
                onPressed: diskAsync.isLoading
                    ? null
                    : () => ref.read(smartCareProvider.notifier).refresh(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiskStats extends StatelessWidget {
  final DiskInfo info;
  final Color accentColor;
  const _DiskStats({required this.info, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatRow(
          label: context.t.smartCare.totalStorage,
          value: info.formattedTotal,
          color: accentColor,
        ),
        const SizedBox(height: 12),
        _StatRow(
          label: context.t.smartCare.used,
          value: info.formattedUsed,
          color: Colors.orangeAccent,
        ),
        const SizedBox(height: 12),
        _StatRow(
          label: context.t.smartCare.available,
          value: info.formattedFree,
          color: Colors.white70,
        ),
        const SizedBox(height: 20),
        // Usage bar
        SizedBox(
          width: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: info.usedPercent,
                  backgroundColor: Colors.white12,
                  valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                context.t.smartCare.percentUsed.replaceAll(
                  '{percent}',
                  (info.usedPercent * 100).toStringAsFixed(1),
                ),
                style: const TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.15),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Icon(Icons.circle, size: 8, color: color),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DiskRing extends StatelessWidget {
  final DiskInfo info;
  final Color accentColor;
  const _DiskRing({required this.info, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: CustomPaint(
        painter: _RingPainter(progress: info.usedPercent, color: accentColor),
        child: Center(
          child: Text(
            '${(info.usedPercent * 100).toStringAsFixed(0)}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _RingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 6;
    const strokeWidth = 8.0;

    // Background ring
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white12
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.color != color;
}
