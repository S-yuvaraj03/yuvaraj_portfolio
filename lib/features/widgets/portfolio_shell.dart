import 'package:flutter/material.dart';
import 'package:yuvaraj_portfolio/features/widgets/hero/hero_section.dart';

import 'dynamic_island.dart';
import 'galaxy_background.dart';

class PortfolioShell extends StatelessWidget {
  const PortfolioShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: GalaxyBackground()),

        SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: DynamicIsland(),
              ),

              const Expanded(
                child: SingleChildScrollView(child: HeroSection()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class _PortfolioPlaceholder extends StatelessWidget {
//   const _PortfolioPlaceholder({required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
//     );
//   }
// }
