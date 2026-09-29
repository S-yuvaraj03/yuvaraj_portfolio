import 'package:flutter/material.dart';
import 'package:yuvaraj_portfolio/features/widgets/hero/hero_section.dart';

import 'dynamic_island.dart';
import 'galaxy_background.dart';
import 'portfolio_sections.dart';

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
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      HeroSection(),
                      PortfolioSections(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
