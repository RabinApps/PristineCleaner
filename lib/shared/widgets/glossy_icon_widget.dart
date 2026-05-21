import 'dart:math';
import 'package:flutter/material.dart';

enum OrbShape { circle, squircle, blob, hexagon }

class GlossyIconWidget extends StatelessWidget {
  final Color baseColor;
  final IconData icon;
  final double size;
  final OrbShape shape;

  const GlossyIconWidget({
    super.key,
    required this.baseColor,
    required this.icon,
    this.size = 260,
    this.shape = OrbShape.circle,
  });

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final light = _lighten(baseColor, 0.22);
    final dark = _darken(baseColor, 0.12);
    final glow = baseColor.withOpacity(0.55);

    final inner = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: shape == OrbShape.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape == OrbShape.circle ? null : _borderRadius(),
        gradient: RadialGradient(
          center: const Alignment(-0.38, -0.38),
          radius: 1.1,
          colors: [light, baseColor, dark],
          stops: const [0.0, 0.45, 1.0],
        ),
        boxShadow: [
          BoxShadow(color: glow, blurRadius: 70, spreadRadius: 12),
          BoxShadow(
            color: glow.withOpacity(0.25),
            blurRadius: 120,
            spreadRadius: 20,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Glossy top-left highlight
          Positioned(
            top: size * 0.09,
            left: size * 0.16,
            child: Container(
              width: size * 0.48,
              height: size * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.32),
                    Colors.white.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // Bottom reflection
          Positioned(
            bottom: size * 0.08,
            left: size * 0.3,
            right: size * 0.3,
            child: Container(
              height: size * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.06),
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),
          Center(
            child: Icon(
              icon,
              size: size * 0.34,
              color: Colors.white.withOpacity(0.93),
            ),
          ),
        ],
      ),
    );

    if (shape == OrbShape.hexagon) {
      return ClipPath(clipper: _HexClipper(), child: inner);
    }

    return inner;
  }

  BorderRadius? _borderRadius() {
    switch (shape) {
      case OrbShape.squircle:
        return BorderRadius.circular(size * 0.26);
      case OrbShape.blob:
        return BorderRadius.only(
          topLeft: Radius.circular(size * 0.45),
          topRight: Radius.circular(size * 0.22),
          bottomLeft: Radius.circular(size * 0.22),
          bottomRight: Radius.circular(size * 0.42),
        );
      case OrbShape.hexagon:
        return BorderRadius.circular(size * 0.1);
      default:
        return BorderRadius.circular(size * 0.2);
    }
  }
}

class _HexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = min(size.width, size.height) / 2 * 0.92;
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 6;
      final x = cx + r * cos(angle);
      final y = cy + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_HexClipper old) => false;
}
