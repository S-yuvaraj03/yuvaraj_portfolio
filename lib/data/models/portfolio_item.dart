import 'package:equatable/equatable.dart';

enum PortfolioItemType {
  skill,
  project,
  experience,
  education,
  softSkill,
  social,
}

class PortfolioItem extends Equatable {
  const PortfolioItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.keywords,
    this.description,
    this.route,
    this.imageUrl,
  });

  final String id;
  final String title;
  final String subtitle;
  final PortfolioItemType type;

  final List<String> keywords;

  final String? description;
  final String? route;
  final String? imageUrl;

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    type,
    keywords,
    description,
    route,
    imageUrl,
  ];
}
