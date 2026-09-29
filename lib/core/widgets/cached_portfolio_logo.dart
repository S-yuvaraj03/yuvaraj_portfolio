import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedPortfolioLogo extends StatelessWidget {
  const CachedPortfolioLogo({
    required this.url,
    required this.fallback,
    this.size = 32,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String? url;
  final IconData fallback;
  final double size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final source = url;
    if (source == null || source.isEmpty) {
      return _Fallback(icon: fallback, size: size);
    }

    if (source.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        source,
        width: size,
        height: size,
        fit: fit,
        placeholderBuilder: (_) => SizedBox(
          width: size,
          height: size,
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 1.5),
          ),
        ),
        errorBuilder: (_, _, _) => _Fallback(icon: fallback, size: size),
      );
    }

    return Image.network(
      source,
      width: size,
      height: size,
      fit: fit,
      cacheWidth: (size * 2).round(),
      errorBuilder: (_, _, _) => _Fallback(icon: fallback, size: size),
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          width: size,
          height: size,
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 1.5),
          ),
        );
      },
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.icon, required this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: Theme.of(context).colorScheme.primary);
  }
}
