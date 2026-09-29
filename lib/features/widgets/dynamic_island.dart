import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yuvaraj_portfolio/features/portfolio/bloc/portfolio_bloc.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import 'package:yuvaraj_portfolio/features/portfolio/data/island_navigation_data.dart';
import 'package:yuvaraj_portfolio/features/portfolio/models/island_navigation_item.dart';
import '../../../data/models/portfolio_item.dart';

class DynamicIsland extends StatelessWidget {
  const DynamicIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioBloc, PortfolioState, DynamicIslandMode>(
      selector: (state) => state.islandMode,
      builder: (context, mode) {
        final isCompact = mode == DynamicIslandMode.compact;

        return GestureDetector(
          onTap: isCompact
              ? () {
                  context.read<PortfolioBloc>().add(
                    const DynamicIslandToggled(),
                  );
                }
              : null,
          child: AnimatedContainer(
            duration: AppConstants.normalAnimation,
            curve: Curves.easeInOutCubic,
            width: switch (mode) {
              DynamicIslandMode.compact => 230,
              DynamicIslandMode.navigation => _expandedWidth(context),
              DynamicIslandMode.search => _searchWidth(context),
              DynamicIslandMode.notification => 360,
              DynamicIslandMode.project => 420,
            },
            height: switch (mode) {
              DynamicIslandMode.compact => 46,
              DynamicIslandMode.navigation => 92,
              DynamicIslandMode.search => 320,
              DynamicIslandMode.notification => 80,
              DynamicIslandMode.project => 120,
            },
            padding: switch (mode) {
              DynamicIslandMode.compact => const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              DynamicIslandMode.navigation => const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              DynamicIslandMode.search => const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                16,
              ),

              DynamicIslandMode.notification => const EdgeInsets.all(12),

              DynamicIslandMode.project => const EdgeInsets.all(16),
            },
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.96),
              borderRadius: BorderRadius.circular(isCompact ? 30 : 32),
              border: Border.all(color: AppColors.border),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 2,
                  color: Color(0x3300D9FF),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: AppConstants.fastAnimation,
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: _IslandContent(mode: mode),
            ),
          ),
        );
      },
    );
  }

  double _expandedWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth < 600) {
      return screenWidth - 32;
    }

    return 620;
  }
}

class _CompactIsland extends StatelessWidget {
  const _CompactIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _StatusDot(),
        SizedBox(width: 10),
        Text(
          'Exploring my universe',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _NavigationIsland extends StatelessWidget {
  const _NavigationIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: IslandNavigationData.items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final item = IslandNavigationData.items[index];

              return _NavigationItem(item: item);
            },
          ),
        ),

        const SizedBox(width: 8),

        _IslandAction(
          icon: Icons.search_rounded,
          onPressed: () {
            context.read<PortfolioBloc>().add(
              const DynamicIslandModeChanged(DynamicIslandMode.search),
            );
          },
        ),

        const SizedBox(width: 4),

        _IslandAction(
          icon: Icons.close_rounded,
          onPressed: () {
            context.read<PortfolioBloc>().add(
              const DynamicIslandModeChanged(DynamicIslandMode.compact),
            );
          },
        ),
      ],
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({required this.item});

  final IslandNavigationItem item;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioBloc, PortfolioState, PortfolioSection>(
      selector: (state) => state.section,
      builder: (context, selectedSection) {
        final selected = selectedSection == item.section;

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            context.read<PortfolioBloc>().add(
              PortfolioSectionChanged(item.section),
            );

            context.go(item.route);
          },
          child: AnimatedContainer(
            duration: AppConstants.fastAnimation,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: 20,
                  color: selected
                      ? AppColors.secondary
                      : AppColors.textSecondary,
                ),
                const SizedBox(height: 2),
                Text(
                  item.label,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 9,
                    height: 1,
                    color: selected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IslandAction extends StatelessWidget {
  const _IslandAction({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      tooltip: icon == Icons.search_rounded ? 'Search' : 'Close',
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.success,
      ),
    );
  }
}

class _IslandContent extends StatelessWidget {
  const _IslandContent({required this.mode});

  final DynamicIslandMode mode;

  @override
  Widget build(BuildContext context) {
    return switch (mode) {
      DynamicIslandMode.compact => const _CompactIsland(
        key: ValueKey('compact'),
      ),

      DynamicIslandMode.navigation => const _NavigationIsland(
        key: ValueKey('navigation'),
      ),

      DynamicIslandMode.search => const _SearchIsland(key: ValueKey('search')),

      DynamicIslandMode.notification => const _CompactIsland(
        key: ValueKey('notification'),
      ),

      DynamicIslandMode.project => const _CompactIsland(
        key: ValueKey('project'),
      ),
    };
  }
}

double _searchWidth(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;

  if (screenWidth < 600) {
    return screenWidth - 24;
  }

  return 560;
}

class _SearchIsland extends StatelessWidget {
  const _SearchIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Row(
            children: [
              const Icon(Icons.search_rounded, color: AppColors.secondary),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    context.read<PortfolioBloc>().add(
                      PortfolioSearchChanged(value),
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search my universe...',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              _IslandAction(
                icon: Icons.close_rounded,
                onPressed: () {
                  context.read<PortfolioBloc>().add(
                    const DynamicIslandModeChanged(DynamicIslandMode.compact),
                  );
                },
              ),
            ],
          ),
        ),

        const Divider(height: 1, color: AppColors.border),

        const SizedBox(height: 8),

        const Expanded(child: _SearchResults()),
      ],
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      buildWhen: (previous, current) =>
          previous.searchQuery != current.searchQuery ||
          previous.searchResults != current.searchResults,
      builder: (context, state) {
        if (state.searchQuery.isEmpty) {
          return const _SearchHint();
        }

        if (state.searchResults.isEmpty) {
          return const Center(
            child: Text(
              'Nothing found in this universe 👀',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          );
        }

        return ListView.separated(
          itemCount: state.searchResults.length,
          separatorBuilder: (_, _) =>
              const Divider(height: 1, color: AppColors.border),
          itemBuilder: (context, index) {
            return _SearchResultTile(item: state.searchResults[index]);
          },
        );
      },
    );
  }
}

class _SearchHint extends StatelessWidget {
  const _SearchHint();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.auto_awesome_rounded, color: AppColors.primary, size: 30),
          SizedBox(height: 12),
          Text(
            'Search anything about me',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            'Try Flutter, UPI, college or leadership',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  const _SearchResultTile({required this.item});

  final PortfolioItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: _SearchResultIcon(type: item.type),
      title: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        item.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12),
      onTap: () {
        final route = item.route;

        if (route != null) {
          context.read<PortfolioBloc>().add(
            const DynamicIslandModeChanged(DynamicIslandMode.compact),
          );

          context.go(route);
        }
      },
    );
  }
}

class _SearchResultIcon extends StatelessWidget {
  const _SearchResultIcon({required this.type});

  final PortfolioItemType type;

  @override
  Widget build(BuildContext context) {
    final icon = switch (type) {
      PortfolioItemType.skill => Icons.bolt_rounded,
      PortfolioItemType.project => Icons.rocket_launch_rounded,
      PortfolioItemType.experience => Icons.work_rounded,
      PortfolioItemType.education => Icons.school_rounded,
      PortfolioItemType.softSkill => Icons.psychology_rounded,
      PortfolioItemType.social => Icons.link_rounded,
    };

    return Container(
      width: 38,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 19, color: AppColors.secondary),
    );
  }
}
