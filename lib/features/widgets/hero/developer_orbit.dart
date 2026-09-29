import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

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
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.compact ? 260.0 : 380.0;

    return SizedBox.square(
      dimension: size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              const _OrbitRing(sizeFactor: 0.95),

              const _OrbitRing(sizeFactor: 0.72),

              Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: const _OrbitItems(),
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
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.18)),
        ),
      ),
    );
  }
}

class _OrbitItems extends StatelessWidget {
  const _OrbitItems();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _OrbitDot(label: 'Dart'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _OrbitDot(label: 'Git'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _OrbitDot(label: 'BLoC'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _OrbitDot(label: 'Flutter'),
          ),
        ],
      ),
    );
  }
}

class _OrbitDot extends StatelessWidget {
  const _OrbitDot({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _DeveloperCore extends StatelessWidget {
  const _DeveloperCore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 45,
          ),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.code_rounded, size: 44),
          SizedBox(height: 6),
          Text(
            'YS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
