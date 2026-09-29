import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuvaraj_portfolio/data/models/portfolio_item.dart';
import 'package:yuvaraj_portfolio/data/portfolio/portfolio_data.dart';
import 'package:yuvaraj_portfolio/features/portfolio/services/portfolio_search_service.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioState()) {
    on<PortfolioSearchChanged>(_onSearchChanged);
    on<PortfolioSectionChanged>(_onSectionChanged);
    on<DynamicIslandModeChanged>(_onIslandModeChanged);
    on<DynamicIslandToggled>(_onIslandToggled);
  }

  void _onSearchChanged(
    PortfolioSearchChanged event,
    Emitter<PortfolioState> emit,
  ) {
    final query = event.query.trim();

    final results = PortfolioSearchService.search(
      query: query,
      items: PortfolioData.items,
    );

    emit(state.copyWith(searchQuery: query, searchResults: results));
  }

  void _onSectionChanged(
    PortfolioSectionChanged event,
    Emitter<PortfolioState> emit,
  ) {
    emit(
      state.copyWith(
        section: event.section,
        islandMode: DynamicIslandMode.compact,
      ),
    );
  }

  void _onIslandModeChanged(
    DynamicIslandModeChanged event,
    Emitter<PortfolioState> emit,
  ) {
    final shouldClearSearch = event.mode != DynamicIslandMode.search;

    emit(
      state.copyWith(
        islandMode: event.mode,
        searchQuery: shouldClearSearch ? '' : state.searchQuery,
        searchResults: shouldClearSearch ? const [] : state.searchResults,
      ),
    );
  }

  void _onIslandToggled(
    DynamicIslandToggled event,
    Emitter<PortfolioState> emit,
  ) {
    final nextMode = state.islandMode == DynamicIslandMode.compact
        ? DynamicIslandMode.navigation
        : DynamicIslandMode.compact;

    emit(state.copyWith(islandMode: nextMode));
  }
}
