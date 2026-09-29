import 'package:flutter/material.dart';

import '../../../app/router/app_routes.dart';
import '../bloc/portfolio_bloc.dart';
import '../models/island_navigation_item.dart';

abstract final class IslandNavigationData {
  static const List<IslandNavigationItem> items = [
    IslandNavigationItem(
      label: 'Home',
      icon: Icons.home_rounded,
      section: PortfolioSection.home,
      route: AppRoutes.home,
    ),
    IslandNavigationItem(
      label: 'About',
      icon: Icons.person_rounded,
      section: PortfolioSection.about,
      route: AppRoutes.about,
    ),
    IslandNavigationItem(
      label: 'Skills',
      icon: Icons.bolt_rounded,
      section: PortfolioSection.skills,
      route: AppRoutes.skills,
    ),
    IslandNavigationItem(
      label: 'Projects',
      icon: Icons.rocket_launch_rounded,
      section: PortfolioSection.projects,
      route: AppRoutes.projects,
    ),
    IslandNavigationItem(
      label: 'Experience',
      icon: Icons.work_rounded,
      section: PortfolioSection.experience,
      route: AppRoutes.experience,
    ),
    IslandNavigationItem(
      label: 'Education',
      icon: Icons.school_rounded,
      section: PortfolioSection.education,
      route: AppRoutes.education,
    ),
    IslandNavigationItem(
      label: 'Contact',
      icon: Icons.mail_rounded,
      section: PortfolioSection.contact,
      route: AppRoutes.contact,
    ),
  ];
}
