part of 'portfolio_bloc.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

final class PortfolioSearchChanged extends PortfolioEvent {
  const PortfolioSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class PortfolioSectionChanged extends PortfolioEvent {
  const PortfolioSectionChanged(this.section);

  final PortfolioSection section;

  @override
  List<Object?> get props => [section];
}

final class PortfolioItemSelected extends PortfolioEvent {
  const PortfolioItemSelected({
    required this.section,
    required this.itemId,
  });

  final PortfolioSection section;
  final String itemId;

  @override
  List<Object?> get props => [section, itemId];
}

final class DynamicIslandModeChanged extends PortfolioEvent {
  const DynamicIslandModeChanged(this.mode);

  final DynamicIslandMode mode;

  @override
  List<Object?> get props => [mode];
}

final class DynamicIslandToggled extends PortfolioEvent {
  const DynamicIslandToggled();
}
