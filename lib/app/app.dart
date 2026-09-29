import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/portfolio/bloc/portfolio_bloc.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PortfolioBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Yuvaraj | Flutter Developer',
        theme: AppTheme.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
