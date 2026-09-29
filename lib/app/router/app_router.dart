import 'package:go_router/go_router.dart';
import 'package:yuvaraj_portfolio/features/view/portfolio_page.dart';

import 'app_routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(path: AppRoutes.home, builder: (_, _) => const PortfolioPage()),
      GoRoute(path: AppRoutes.about, builder: (_, _) => const PortfolioPage()),
      GoRoute(path: AppRoutes.skills, builder: (_, _) => const PortfolioPage()),
      GoRoute(
        path: AppRoutes.projects,
        builder: (_, _) => const PortfolioPage(),
      ),
      GoRoute(
        path: AppRoutes.experience,
        builder: (_, _) => const PortfolioPage(),
      ),
      GoRoute(
        path: AppRoutes.education,
        builder: (_, _) => const PortfolioPage(),
      ),
      GoRoute(
        path: AppRoutes.contact,
        builder: (_, _) => const PortfolioPage(),
      ),
    ],
  );
}
