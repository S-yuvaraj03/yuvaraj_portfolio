import 'package:flutter/material.dart';
import 'package:yuvaraj_portfolio/app/theme/app_colors.dart';
import 'package:yuvaraj_portfolio/data/models/portfolio_item.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_data.dart';

class PortfolioSections extends StatelessWidget {
  const PortfolioSections({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 600 ? 20.0 : width < 1200 ? 48.0 : 88.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 24, horizontal, 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _AboutSection(),
          const SizedBox(height: 72),
          _CollectionSection(
            eyebrow: 'TOOLKIT',
            title: 'Skills that ship products',
            description:
                'A mobile-first toolkit spanning Flutter architecture, state management, APIs, databases and delivery workflows.',
            items: _itemsOf(PortfolioItemType.skill),
          ),
          const SizedBox(height: 72),
          _CollectionSection(
            eyebrow: 'SELECTED WORK',
            title: 'Projects built around real problems',
            description:
                'Production banking work and hands-on products focused on reliability, offline capability and maintainable Flutter code.',
            items: _itemsOf(PortfolioItemType.project),
          ),
          const SizedBox(height: 72),
          _CollectionSection(
            eyebrow: 'EXPERIENCE',
            title: 'Building where reliability matters',
            description:
                'Experience collaborating across product, design, backend and client teams while owning delivery and production debugging.',
            items: _itemsOf(PortfolioItemType.experience),
          ),
          const SizedBox(height: 72),
          _CollectionSection(
            eyebrow: 'EDUCATION',
            title: 'Learning beyond the codebase',
            description:
                'Formal education alongside continuous hands-on learning in mobile, backend and software architecture.',
            items: _itemsOf(PortfolioItemType.education),
          ),
          const SizedBox(height: 72),
          const _ContactSection(),
        ],
      ),
    );
  }

  static List<PortfolioItem> _itemsOf(PortfolioItemType type) =>
      PortfolioData.items.where((item) => item.type == type).toList(growable: false);
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final intro = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Eyebrow('ABOUT'),
              const SizedBox(height: 12),
              Text(
                'I turn complex mobile journeys into clear, dependable experiences.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.08,
                    ),
              ),
              const SizedBox(height: 16),
              const Text(
                'My work combines Flutter engineering, clean architecture, API integration and production debugging. I enjoy owning a problem end-to-end, collaborating closely with stakeholders, and leaving the codebase easier to change than I found it.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  height: 1.65,
                  fontSize: 15,
                ),
              ),
            ],
          );

          const strengths = Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _Pill('Problem solving'),
              _Pill('Ownership'),
              _Pill('Client collaboration'),
              _Pill('Code review'),
              _Pill('Production debugging'),
              _Pill('Adaptability'),
            ],
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [intro, const SizedBox(height: 28), strengths],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 3, child: intro),
              const SizedBox(width: 48),
              const Expanded(flex: 2, child: strengths),
            ],
          );
        },
      ),
    );
  }
}

class _CollectionSection extends StatelessWidget {
  const _CollectionSection({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.items,
  });

  final String eyebrow;
  final String title;
  final String description;
  final List<PortfolioItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Eyebrow(eyebrow),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.55,
            ),
          ),
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 1050
                ? 3
                : constraints.maxWidth >= 650
                    ? 2
                    : 1;
            final gap = 16.0;
            final cardWidth =
                (constraints.maxWidth - (gap * (columns - 1))) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final item in items)
                  SizedBox(width: cardWidth, child: _PortfolioCard(item: item)),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _PortfolioCard extends StatefulWidget {
  const _PortfolioCard({required this.item});

  final PortfolioItem item;

  @override
  State<_PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<_PortfolioCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.surfaceLight.withValues(alpha: 0.92)
              : AppColors.surface.withValues(alpha: 0.78),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered
                ? AppColors.secondary.withValues(alpha: 0.38)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? const [
                  BoxShadow(
                    blurRadius: 28,
                    color: Color(0x2200D9FF),
                    offset: Offset(0, 10),
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TypeIcon(type: item.type),
            const SizedBox(height: 18),
            Text(
              item.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 7),
            Text(
              item.subtitle,
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            if (item.description != null) ...[
              const SizedBox(height: 12),
              Text(
                item.description!,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  height: 1.5,
                  fontSize: 13,
                ),
              ),
            ],
            const SizedBox(height: 16),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: item.keywords
                  .take(5)
                  .map((keyword) => _MiniTag(keyword))
                  .toList(growable: false),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.secondary,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            'Let’s build something useful.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 12),
          const ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 620),
            child: Text(
              'I’m interested in Flutter, mobile engineering and software roles where product quality, learning and ownership matter.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, height: 1.6),
            ),
          ),
          const SizedBox(height: 22),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              _Pill('Flutter'),
              _Pill('Mobile Engineering'),
              _Pill('FinTech'),
              _Pill('Full-stack growth'),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Contact and social links can be added from the portfolio data configuration.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  const _GlassPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width < 600 ? 22 : 34),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            blurRadius: 45,
            spreadRadius: -18,
            color: Color(0x336C63FF),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.type});

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
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: Colors.white, size: 21),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.secondary,
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 2.2,
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 10,
        ),
      ),
    );
  }
}
