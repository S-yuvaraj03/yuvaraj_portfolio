import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import 'developer_orbit.dart';
import 'hero_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppConstants.mobileBreakpoint;

        if (isMobile) {
          return const _MobileHero();
        }

        return const _DesktopHero();
      },
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 48),
      child: Row(
        children: [
          Expanded(flex: 6, child: HeroContent()),
          Expanded(flex: 4, child: DeveloperOrbit()),
        ],
      ),
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
      child: Column(
        children: [
          DeveloperOrbit(compact: true),
          SizedBox(height: 32),
          HeroContent(centered: true),
        ],
      ),
    );
  }
}
