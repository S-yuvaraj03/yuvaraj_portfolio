import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuvaraj_portfolio/app/router/app_routes.dart';
import 'package:yuvaraj_portfolio/data/models/portfolio_item.dart';
import 'package:yuvaraj_portfolio/data/portfolio/contact_data.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_data.dart';

enum PortfolioDetailSection { about, skills, projects, experience, education, contact }

class PortfolioDetailPage extends StatelessWidget {
  const PortfolioDetailPage({required this.section, super.key});
  final PortfolioDetailSection section;

  @override
  Widget build(BuildContext context) {
    final config = _config(section);
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 600 ? 20.0 : width < 1100 ? 48.0 : 96.0;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EA),
      body: Stack(children: [
        const Positioned.fill(child: CustomPaint(painter: _GridPainter())),
        SafeArea(child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(horizontal, 24, horizontal, 64),
          child: Center(child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _TopBar(section: section),
              const SizedBox(height: 64),
              Text(config.number, style: const TextStyle(color: Color(0xFF8D7E68), fontWeight: FontWeight.w700, letterSpacing: 2)),
              const SizedBox(height: 14),
              Text(config.title, style: TextStyle(color: const Color(0xFF171717), fontSize: width < 600 ? 42 : 72, height: .95, fontWeight: FontWeight.w900, letterSpacing: -2.4)),
              const SizedBox(height: 22),
              ConstrainedBox(constraints: const BoxConstraints(maxWidth: 720), child: Text(config.description, style: const TextStyle(color: Color(0xFF5E5A53), fontSize: 17, height: 1.65))),
              const SizedBox(height: 52),
              _SectionBody(section: section),
            ]),
          )),
        )),
      ]),
    );
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody({required this.section});
  final PortfolioDetailSection section;
  @override
  Widget build(BuildContext context) => switch (section) {
    PortfolioDetailSection.about => const _AboutBody(),
    PortfolioDetailSection.skills => _ItemGrid(items: _items(PortfolioItemType.skill)),
    PortfolioDetailSection.projects => _ItemGrid(items: _items(PortfolioItemType.project)),
    PortfolioDetailSection.experience => _ItemGrid(items: _items(PortfolioItemType.experience)),
    PortfolioDetailSection.education => _ItemGrid(items: _items(PortfolioItemType.education)),
    PortfolioDetailSection.contact => const _ContactBody(),
  };
  static List<PortfolioItem> _items(PortfolioItemType type) => PortfolioData.items.where((e) => e.type == type).toList(growable: false);
}

class _AboutBody extends StatelessWidget {
  const _AboutBody();
  @override
  Widget build(BuildContext context) => const Wrap(spacing: 16, runSpacing: 16, children: [
    _StatementCard(index: '01', title: 'Problem solver', body: 'I break difficult mobile problems into smaller, testable pieces and improve the experience without hiding complexity.'),
    _StatementCard(index: '02', title: 'Product ownership', body: 'I work beyond the UI layer: requirements, API integration, debugging, code review and release reliability all matter.'),
    _StatementCard(index: '03', title: 'Cross-functional', body: 'I collaborate with product, design, backend, client and testing teams to move features from requirement to dependable delivery.'),
  ]);
}

class _ItemGrid extends StatelessWidget {
  const _ItemGrid({required this.items});
  final List<PortfolioItem> items;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, constraints) {
    final columns = constraints.maxWidth >= 900 ? 3 : constraints.maxWidth >= 560 ? 2 : 1;
    const gap = 16.0;
    final cardWidth = (constraints.maxWidth - gap * (columns - 1)) / columns;
    return Wrap(spacing: gap, runSpacing: gap, children: [
      for (var i = 0; i < items.length; i++) SizedBox(width: cardWidth, child: _EditorialCard(item: items[i], index: i + 1)),
    ]);
  });
}

class _EditorialCard extends StatelessWidget {
  const _EditorialCard({required this.item, required this.index});
  final PortfolioItem item;
  final int index;
  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 230),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(color: Colors.white.withValues(alpha: .72), border: Border.all(color: const Color(0xFFD8D0C3)), borderRadius: BorderRadius.circular(3)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(index.toString().padLeft(2, '0'), style: const TextStyle(color: Color(0xFFB15C3D), fontWeight: FontWeight.w800)),
      const SizedBox(height: 34),
      Text(item.title, style: const TextStyle(color: Color(0xFF171717), fontSize: 21, fontWeight: FontWeight.w800, height: 1.1)),
      const SizedBox(height: 8),
      Text(item.subtitle, style: const TextStyle(color: Color(0xFF8D7E68), fontWeight: FontWeight.w600)),
      if (item.description != null) ...[const SizedBox(height: 14), Text(item.description!, style: const TextStyle(color: Color(0xFF5E5A53), height: 1.5))],
      const SizedBox(height: 18),
      Wrap(spacing: 7, runSpacing: 7, children: item.keywords.take(4).map((word) => Text('#$word', style: const TextStyle(color: Color(0xFF6E675D), fontSize: 11))).toList(growable: false)),
    ]),
  );
}

class _StatementCard extends StatelessWidget {
  const _StatementCard({required this.index, required this.title, required this.body});
  final String index;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.sizeOf(context).width < 700 ? double.infinity : 340,
    padding: const EdgeInsets.all(26),
    decoration: BoxDecoration(color: const Color(0xFF171717), borderRadius: BorderRadius.circular(3)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(index, style: const TextStyle(color: Color(0xFFD98763))),
      const SizedBox(height: 42),
      Text(title, style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      Text(body, style: const TextStyle(color: Color(0xFFC8C3BA), height: 1.55)),
    ]),
  );
}

class _ContactBody extends StatelessWidget {
  const _ContactBody();
  @override
  Widget build(BuildContext context) {
    const entries = <({String label, String value, String? uri})>[
      (label: 'Email', value: ContactData.email, uri: 'mailto:syuvaraj3402@gmail.com'),
      (label: 'Phone', value: ContactData.phone, uri: 'tel:+917401003208'),
      (label: 'LinkedIn', value: 'connect-with-yuvaraj-s', uri: ContactData.linkedIn),
      (label: 'GitHub', value: 'S-yuvaraj03', uri: ContactData.github),
      (label: 'Location', value: ContactData.location, uri: null),
    ];
    return Column(children: [for (final entry in entries) _ContactRow(label: entry.label, value: entry.value, uri: entry.uri)]);
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.label, required this.value, required this.uri});
  final String label;
  final String value;
  final String? uri;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: uri == null ? null : () async {
      final target = Uri.parse(uri!);
      if (await canLaunchUrl(target)) await launchUrl(target);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFD8D0C3)))),
      child: Row(children: [
        SizedBox(width: 110, child: Text(label.toUpperCase(), style: const TextStyle(color: Color(0xFF8D7E68), fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.4))),
        Expanded(child: Text(value, style: const TextStyle(color: Color(0xFF171717), fontSize: 17, fontWeight: FontWeight.w700))),
        if (uri != null) const Icon(Icons.north_east_rounded, color: Color(0xFFB15C3D)),
      ]),
    ),
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.section});
  final PortfolioDetailSection section;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(children: [
      InkWell(onTap: () => context.go(AppRoutes.home), child: const Text('YS / PORTFOLIO', style: TextStyle(color: Color(0xFF171717), fontWeight: FontWeight.w900, letterSpacing: 1.3))),
      const Spacer(),
      if (width >= 760)
        ...PortfolioDetailSection.values.map((item) => Padding(
          padding: const EdgeInsets.only(left: 18),
          child: InkWell(onTap: () => context.go(_route(item)), child: Text(item.name.toUpperCase(), style: TextStyle(color: item == section ? const Color(0xFFB15C3D) : const Color(0xFF6E675D), fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1))),
        ))
      else
        PopupMenuButton<PortfolioDetailSection>(
          iconColor: const Color(0xFF171717),
          onSelected: (item) => context.go(_route(item)),
          itemBuilder: (_) => PortfolioDetailSection.values.map((item) => PopupMenuItem(value: item, child: Text(item.name.toUpperCase()))).toList(growable: false),
        ),
    ]);
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0x0C171717)..strokeWidth = 1;
    const step = 56.0;
    for (double x = 0; x < size.width; x += step) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint); }
    for (double y = 0; y < size.height; y += step) { canvas.drawLine(Offset(0, y), Offset(size.width, y), paint); }
  }
  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => false;
}

class _PageConfig {
  const _PageConfig(this.number, this.title, this.description);
  final String number;
  final String title;
  final String description;
}

_PageConfig _config(PortfolioDetailSection section) => switch (section) {
  PortfolioDetailSection.about => const _PageConfig('01 / PROFILE', 'About me.', 'A closer look at how I approach engineering, ownership and collaboration.'),
  PortfolioDetailSection.skills => const _PageConfig('02 / TOOLKIT', 'Skills.', 'The technologies and engineering practices I use to build maintainable mobile products.'),
  PortfolioDetailSection.projects => const _PageConfig('03 / WORK', 'Projects.', 'Production banking journeys and hands-on products where I have applied Flutter to real problems.'),
  PortfolioDetailSection.experience => const _PageConfig('04 / CAREER', 'Experience.', 'Professional experience focused on mobile engineering, fintech delivery and cross-functional collaboration.'),
  PortfolioDetailSection.education => const _PageConfig('05 / LEARNING', 'Education.', 'Formal education complemented by continuous hands-on learning across mobile and backend engineering.'),
  PortfolioDetailSection.contact => const _PageConfig('06 / CONNECT', 'Contact.', 'For Flutter, mobile engineering and software opportunities, these are the direct ways to reach me.'),
};

String _route(PortfolioDetailSection section) => switch (section) {
  PortfolioDetailSection.about => AppRoutes.about,
  PortfolioDetailSection.skills => AppRoutes.skills,
  PortfolioDetailSection.projects => AppRoutes.projects,
  PortfolioDetailSection.experience => AppRoutes.experience,
  PortfolioDetailSection.education => AppRoutes.education,
  PortfolioDetailSection.contact => AppRoutes.contact,
};
