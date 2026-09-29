import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_links.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class HeroContent extends StatefulWidget {
  const HeroContent({this.centered = false, super.key});

  final bool centered;

  @override
  State<HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<HeroContent> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(AppConstants.fastAnimation, () {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final alignment = widget.centered ? TextAlign.center : TextAlign.start;

    return AnimatedOpacity(
      duration: AppConstants.slowAnimation,
      opacity: _visible ? 1 : 0,
      child: AnimatedSlide(
        duration: AppConstants.slowAnimation,
        curve: Curves.easeOutCubic,
        offset: _visible ? Offset.zero : const Offset(0, 0.15),
        child: Column(
          crossAxisAlignment: widget.centered
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              'WELCOME TO MY UNIVERSE',
              textAlign: alignment,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 12,
                letterSpacing: 3,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              "Hi, I'm Yuvaraj 👋",
              textAlign: alignment,
              style: const TextStyle(
                fontSize: 46,
                height: 1.05,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ).createShader(bounds);
              },
              child: Text(
                'Flutter Developer',
                textAlign: alignment,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 620,
              child: Text(
                'I build reliable, scalable and delightful mobile '
                'experiences with Flutter, Dart and modern '
                'software architecture.',
                textAlign: alignment,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 17,
                  height: 1.7,
                ),
              ),
            ),

            const SizedBox(height: 26),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: widget.centered ? WrapAlignment.center : WrapAlignment.start,
              children: [
                FilledButton.icon(
                  onPressed: () => _openExternal(PortfolioLinks.cv),
                  icon: const Icon(Icons.download_rounded, size: 18),
                  label: const Text('Download CV'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _openExternal(PortfolioLinks.sbiYono),
                  icon: const Icon(Icons.open_in_new_rounded, size: 17),
                  label: const Text('View SBI YONO'),
                ),
              ],
            ),

            const SizedBox(height: 22),

            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _TechChip(label: 'Flutter'),
                _TechChip(label: 'Dart'),
                _TechChip(label: 'BLoC'),
                _TechChip(label: 'MobX'),
                _TechChip(label: 'Clean Architecture'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _openExternal(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
