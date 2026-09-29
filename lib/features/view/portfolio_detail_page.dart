import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuvaraj_portfolio/app/router/app_routes.dart';
import 'package:yuvaraj_portfolio/app/theme/app_colors.dart';
import 'package:yuvaraj_portfolio/data/models/portfolio_item.dart';
import 'package:yuvaraj_portfolio/data/portfolio/contact_data.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_data.dart';
import 'package:yuvaraj_portfolio/features/widgets/galaxy_background.dart';

enum PortfolioDetailSection {
  about,
  skills,
  projects,
  experience,
  education,
  contact,
}

class PortfolioDetailPage extends StatelessWidget {
  const PortfolioDetailPage({required this.section, super.key});

  final PortfolioDetailSection section;

  @override
  Widget build(BuildContext context) {
    final config = _config(section);
    final items = _itemsFor(section);
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 600 ? 20.0 : width < 1100 ? 48.0 : 88.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(child: GalaxyBackground()),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .18),
                    AppColors.background.withValues(alpha: .76),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(horizontal, 24, horizontal, 72),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _BackButton(),
                      const SizedBox(height: 56),
                      _DetailHeader(config: config),
                      const SizedBox(height: 38),
                      if (section == PortfolioDetailSection.about)
                        const _AboutDetail()
                      else if (section == PortfolioDetailSection.contact)
                        const _ContactDetail()
                      else
                        _DetailGrid(items: items),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.go(AppRoutes.home),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        backgroundColor: Colors.black.withValues(alpha: .54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      icon: const Icon(Icons.arrow_back_rounded, size: 18),
      label: const Text(
        'Back to portfolio',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.config});

  final _PageConfig config;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          config.eyebrow,
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          config.title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: width < 600 ? 38 : 58,
            height: 1,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            config.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.65,
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailGrid extends StatelessWidget {
  const _DetailGrid({required this.items});

  final List<PortfolioItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 920
            ? 2
            : 1;
        const gap = 18.0;
        final width =
            (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final item in items)
              SizedBox(width: width, child: _DetailCard(item: item)),
          ],
        );
      },
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.item});

  final PortfolioItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 230),
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: .84),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            blurRadius: 34,
            spreadRadius: -20,
            color: Color(0x556C63FF),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TypeIcon(type: item.type),
          const SizedBox(height: 22),
          Text(
            item.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            item.subtitle,
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (item.description != null) ...[
            const SizedBox(height: 14),
            Text(
              item.description!,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ],
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: item.keywords
                .take(6)
                .map((word) => _Tag(word))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }
}

class _AboutDetail extends StatelessWidget {
  const _AboutDetail();

  @override
  Widget build(BuildContext context) {
    const cards = [
      (
        'Problem solving',
        'I break difficult mobile problems into smaller, testable pieces and focus on the underlying cause rather than only the visible symptom.'
      ),
      (
        'Ownership',
        'I work beyond the UI layer—from understanding requirements and integrating APIs to debugging production issues, reviewing code and supporting reliable delivery.'
      ),
      (
        'Collaboration',
        'I work with product, design, backend, client and testing teams to turn requirements into maintainable mobile experiences.'
      ),
      (
        'Continuous learning',
        'Flutter is my core mobile stack, while I continue expanding into native Android, backend development, databases, cloud and software architecture.'
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 800 ? 2 : 1;
        const gap = 18.0;
        final width =
            (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final card in cards)
              SizedBox(
                width: width,
                child: Container(
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: .84),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.auto_awesome_rounded,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(height: 18),
                      Text(
                        card.$1,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        card.$2,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ContactDetail extends StatelessWidget {
  const _ContactDetail();

  @override
  Widget build(BuildContext context) {
    const entries = <({String label, String value, String? uri, IconData icon})>[
      (
        label: 'Email',
        value: ContactData.email,
        uri: 'mailto:syuvaraj3402@gmail.com',
        icon: Icons.mail_outline_rounded,
      ),
      (
        label: 'Phone',
        value: ContactData.phone,
        uri: 'tel:+917401003208',
        icon: Icons.phone_outlined,
      ),
      (
        label: 'LinkedIn',
        value: 'connect-with-yuvaraj-s',
        uri: ContactData.linkedIn,
        icon: Icons.work_outline_rounded,
      ),
      (
        label: 'GitHub',
        value: 'S-yuvaraj03',
        uri: ContactData.github,
        icon: Icons.code_rounded,
      ),
      (
        label: 'Location',
        value: ContactData.location,
        uri: null,
        icon: Icons.location_on_outlined,
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: .84),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (final entry in entries)
            _ContactRow(
              label: entry.label,
              value: entry.value,
              uri: entry.uri,
              icon: entry.icon,
            ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.label,
    required this.value,
    required this.uri,
    required this.icon,
  });

  final String label;
  final String value;
  final String? uri;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: uri == null
          ? null
          : () async {
              final target = Uri.parse(uri!);
              if (await canLaunchUrl(target)) {
                await launchUrl(target);
              }
            },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.border),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: AppColors.secondary, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (uri != null)
              const Icon(
                Icons.north_east_rounded,
                color: AppColors.secondary,
                size: 18,
              ),
          ],
        ),
      ),
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
      width: 44,
      height: 44,
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

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .09),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
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

List<PortfolioItem> _itemsFor(PortfolioDetailSection section) {
  final type = switch (section) {
    PortfolioDetailSection.skills => PortfolioItemType.skill,
    PortfolioDetailSection.projects => PortfolioItemType.project,
    PortfolioDetailSection.experience => PortfolioItemType.experience,
    PortfolioDetailSection.education => PortfolioItemType.education,
    _ => null,
  };
  if (type == null) return const [];
  return PortfolioData.items
      .where((item) => item.type == type)
      .toList(growable: false);
}

class _PageConfig {
  const _PageConfig(this.eyebrow, this.title, this.description);

  final String eyebrow;
  final String title;
  final String description;
}

_PageConfig _config(PortfolioDetailSection section) {
  return switch (section) {
    PortfolioDetailSection.about => const _PageConfig(
        'PROFILE / FULL STORY',
        'About me',
        'How I approach engineering, ownership, collaboration and continuous learning.',
      ),
    PortfolioDetailSection.skills => const _PageConfig(
        'TOOLKIT / DETAILS',
        'Skills',
        'A deeper view of the technologies and engineering practices behind my Flutter and mobile development work.',
      ),
    PortfolioDetailSection.projects => const _PageConfig(
        'SELECTED WORK / DETAILS',
        'Projects',
        'A closer look at production banking work and hands-on products built around real user and engineering problems.',
      ),
    PortfolioDetailSection.experience => const _PageConfig(
        'CAREER / DETAILS',
        'Experience',
        'Professional experience focused on mobile engineering, fintech delivery, production reliability and cross-functional collaboration.',
      ),
    PortfolioDetailSection.education => const _PageConfig(
        'LEARNING / DETAILS',
        'Education',
        'Formal education alongside continuous hands-on learning across mobile, backend and software architecture.',
      ),
    PortfolioDetailSection.contact => const _PageConfig(
        'CONNECT / DETAILS',
        'Contact',
        'Direct ways to reach me for Flutter, mobile engineering and software opportunities.',
      ),
  };
}
