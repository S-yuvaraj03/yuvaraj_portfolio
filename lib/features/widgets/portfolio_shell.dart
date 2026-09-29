import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuvaraj_portfolio/features/portfolio/bloc/portfolio_bloc.dart';
import 'package:yuvaraj_portfolio/features/widgets/hero/hero_section.dart';

import 'dynamic_island.dart';
import 'galaxy_background.dart';
import 'portfolio_sections.dart';

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  final _scrollController = ScrollController();

  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _contactKey = GlobalKey();

  final Map<String, GlobalKey> _itemKeys = {};

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  GlobalKey _itemKey(String id) => _itemKeys.putIfAbsent(id, GlobalKey.new);

  GlobalKey _sectionKey(PortfolioSection section) {
    return switch (section) {
      PortfolioSection.home => _homeKey,
      PortfolioSection.about => _aboutKey,
      PortfolioSection.skills => _skillsKey,
      PortfolioSection.projects => _projectsKey,
      PortfolioSection.experience => _experienceKey,
      PortfolioSection.education => _educationKey,
      PortfolioSection.contact => _contactKey,
    };
  }

  Future<void> _scrollToState(PortfolioState state) async {
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) return;

    final targetKey = state.focusedItemId == null
        ? _sectionKey(state.section)
        : _itemKeys[state.focusedItemId!] ?? _sectionKey(state.section);

    final targetContext = targetKey.currentContext;
    if (targetContext == null) return;

    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: state.section == PortfolioSection.home ? 0 : 0.06,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PortfolioBloc, PortfolioState>(
      listenWhen: (previous, current) =>
          previous.section != current.section ||
          previous.navigationRequest != current.navigationRequest,
      listener: (context, state) => _scrollToState(state),
      child: Stack(
        children: [
          const Positioned.fill(child: GalaxyBackground()),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: DynamicIsland(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        KeyedSubtree(key: _homeKey, child: const HeroSection()),
                        PortfolioSections(
                          aboutKey: _aboutKey,
                          skillsKey: _skillsKey,
                          projectsKey: _projectsKey,
                          experienceKey: _experienceKey,
                          educationKey: _educationKey,
                          contactKey: _contactKey,
                          itemKeyBuilder: _itemKey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
