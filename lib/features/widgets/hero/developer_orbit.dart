import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuvaraj_portfolio/app/theme/app_colors.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_image_data.dart';

class DeveloperOrbit extends StatefulWidget {
  const DeveloperOrbit({this.compact = false, super.key});

  final bool compact;

  @override
  State<DeveloperOrbit> createState() => _DeveloperOrbitState();
}

class _DeveloperOrbitState extends State<DeveloperOrbit>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.compact ? 250.0 : 370.0;

    return SizedBox.square(
      dimension: size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final angle = _controller.value * 2 * pi;
          return Stack(
            alignment: Alignment.center,
            children: [
              const _OrbitRing(sizeFactor: .96),
              const _OrbitRing(sizeFactor: .68),
              Transform.rotate(
                angle: angle,
                child: _OrbitItems(counterAngle: -angle),
              ),
              const _DeveloperCore(),
            ],
          );
        },
      ),
    );
  }
}

class _OrbitRing extends StatelessWidget {
  const _OrbitRing({required this.sizeFactor});

  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: sizeFactor,
      heightFactor: sizeFactor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary.withValues(alpha: .2)),
        ),
      ),
    );
  }
}

class _OrbitItems extends StatelessWidget {
  const _OrbitItems({required this.counterAngle});

  final double counterAngle;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _OrbitLogo(
              label: 'Dart',
              url: PortfolioImageData.dart,
              counterAngle: counterAngle,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _OrbitLogo(
              label: 'Git',
              url: PortfolioImageData.git,
              counterAngle: counterAngle,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _OrbitLogo(
              label: 'Firebase',
              url: PortfolioImageData.firebase,
              counterAngle: counterAngle,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _OrbitLogo(
              label: 'Kotlin',
              url: PortfolioImageData.kotlin,
              counterAngle: counterAngle,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrbitLogo extends StatelessWidget {
  const _OrbitLogo({
    required this.label,
    required this.url,
    required this.counterAngle,
  });

  final String label;
  final String url;
  final double counterAngle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: counterAngle,
      child: Tooltip(
        message: label,
        child: Container(
          width: 58,
          height: 58,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xEE0B0F18),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: .32),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: .12),
                blurRadius: 18,
              ),
            ],
          ),
          child: SvgPicture.network(
            url,
            width: 34,
            height: 34,
            fit: BoxFit.contain,
            placeholderBuilder: (_) => const Center(
              child: SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeveloperCore extends StatelessWidget {
  const _DeveloperCore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 126,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface.withValues(alpha: .94),
        border: Border.all(color: AppColors.secondary.withValues(alpha: .34)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: .32),
            blurRadius: 42,
            spreadRadius: 4,
          ),
        ],
      ),
      child: SvgPicture.network(
        PortfolioImageData.flutter,
        fit: BoxFit.contain,
        placeholderBuilder: (_) => const Icon(
          Icons.code_rounded,
          color: AppColors.secondary,
          size: 42,
        ),
      ),
    );
  }
}
