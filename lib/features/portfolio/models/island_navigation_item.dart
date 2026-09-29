import 'package:flutter/material.dart';

import '../bloc/portfolio_bloc.dart';

class IslandNavigationItem {
  const IslandNavigationItem({
    required this.label,
    required this.icon,
    required this.section,
    required this.route,
  });

  final String label;
  final IconData icon;
  final PortfolioSection section;
  final String route;
}
