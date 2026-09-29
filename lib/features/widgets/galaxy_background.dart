import 'dart:math';

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class GalaxyBackground extends StatelessWidget {
  const GalaxyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.3,
                colors: [
                  Color(0xFF171133),
                  Color(0xFF080B18),
                  AppColors.background,
                ],
                stops: [0, 0.45, 1],
              ),
            ),
          ),
        ),
        Positioned.fill(child: CustomPaint(painter: _StarPainter())),
      ],
    );
  }
}

class _StarPainter extends CustomPainter {
  const _StarPainter();

  static const int _starCount = 110;

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);
    final paint = Paint();

    for (var i = 0; i < _starCount; i++) {
      final position = Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      );

      final radius = random.nextDouble() * 1.3 + 0.25;

      paint.color = Colors.white.withValues(
        alpha: random.nextDouble() * 0.55 + 0.15,
      );

      canvas.drawCircle(position, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
