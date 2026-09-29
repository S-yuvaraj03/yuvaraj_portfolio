part of 'portfolio_bloc.dart';

enum PortfolioSection {
  home,
  about,
  skills,
  projects,
  experience,
  education,
  contact,
}

enum DynamicIslandMode {
  compact,
  navigation,
  search,
  notification,
  project,
}

class PortfolioState extends Equatable {
  const PortfolioState({
    this.section = PortfolioSection.home,
    this.islandMode = DynamicIslandMode.compact,
    this.searchQuery = '',
    this.searchResults = const [],
    this.focusedItemId,
  });

  final PortfolioSection section;
  final DynamicIslandMode islandMode;
  final String searchQuery;
  final List<PortfolioItem> searchResults;
  final String? focusedItemId;

  PortfolioState copyWith({
    PortfolioSection? section,
    DynamicIslandMode? islandMode,
    String? searchQuery,
    List<PortfolioItem>? searchResults,
    String? focusedItemId,
    bool clearFocusedItem = false,
  }) {
    return PortfolioState(
      section: section ?? this.section,
      islandMode: islandMode ?? this.islandMode,
      searchQuery: searchQuery ?? this.searchQuery,
      searchResults: searchResults ?? this.searchResults,
      focusedItemId:
          clearFocusedItem ? null : focusedItemId ?? this.focusedItemId,
    );
  }

  @override
  List<Object?> get props => [
        section,
        islandMode,
        searchQuery,
        searchResults,
        focusedItemId,
      ];
}
