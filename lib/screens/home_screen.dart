import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/scan_result.dart';
import '../gen/strings.g.dart';
import '../core/theme/section_themes.dart';
import '../shared/widgets/glossy_icon_widget.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeProvider);
    final theme = SectionThemes.homeLocalized(context);

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
                      homeAsync.when(
                        data: (data) => _DiskRing(
                          info: data.diskInfo,
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
                        error: (error, stackTrace) => const SizedBox.shrink(),
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
                      homeAsync.when(
                        data: (data) => _SystemAndDiskStats(
                          data: data,
                          accentColor: theme.accentColor,
                        ),
                        loading: () => const CircularProgressIndicator(
                          color: Color(0xFF66BB6A),
                        ),
                        error: (e, _) => Text(
                          context.t.home.unableToReadDiskInfo,
                          style: TextStyle(color: Colors.red.shade300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SystemAndDiskStats extends StatelessWidget {
  final HomeDashboardData data;
  final Color accentColor;
  const _SystemAndDiskStats({required this.data, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    final info = data.diskInfo;
    final usage = data.systemUsage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatRow(
          label: context.t.home.totalStorage,
          value: info.formattedTotal,
          color: accentColor,
        ),
        const SizedBox(height: 12),
        _StatRow(
          label: context.t.home.used,
          value: info.formattedUsed,
          color: Colors.orangeAccent,
        ),
        const SizedBox(height: 12),
        _StatRow(
          label: context.t.home.available,
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
                context.t.home.percentUsed.replaceAll(
                  '{percent}',
                  (info.usedPercent * 100).toStringAsFixed(1),
                ),
                style: const TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ],
          ),
        ),
        if (usage.isAvailable) ...[
          const SizedBox(height: 24),

          _StatRow(
            label: context.t.home.cpuUsage,
            value: '${usage.cpuPercent.toStringAsFixed(1)}%',
            color: Colors.lightBlueAccent,
          ),
          const SizedBox(height: 12),
          _StatRow(
            label: context.t.home.ramUsage,
            value:
                '${usage.formattedUsedMemory} / ${usage.formattedTotalMemory}',
            color: Colors.purpleAccent,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: usage.memoryUsedPercent,
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.purpleAccent,
                    ),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  context.t.home.memoryPercentUsed.replaceAll(
                    '{percent}',
                    (usage.memoryUsedPercent * 100).toStringAsFixed(1),
                  ),
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
        ] else
          Text(
            data.systemError ?? context.t.home.unableToReadSystemInfo,
            style: TextStyle(color: Colors.red.shade300, fontSize: 12),
          ),
        const SizedBox(height: 20),
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
            color: color.withValues(alpha: 0.15),
            border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
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
