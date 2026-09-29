import '../../../data/models/portfolio_item.dart';

abstract final class PortfolioSearchService {
  static List<PortfolioItem> search({
    required String query,
    required List<PortfolioItem> items,
  }) {
    final normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return const [];
    }

    return items
        .where((item) {
          final searchableContent = [
            item.title,
            item.subtitle,
            item.description ?? '',
            ...item.keywords,
          ].join(' ').toLowerCase();

          return searchableContent.contains(normalizedQuery);
        })
        .toList(growable: false);
  }
}
