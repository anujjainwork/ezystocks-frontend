

import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';
import 'package:ezystocks/features/search/business/repositories/add_to_watchlist_repo.dart';
import 'package:ezystocks/features/search/business/repositories/search_stock_repo.dart';
import 'package:ezystocks/features/search/data/models/watchlist_model.dart';
import 'package:ezystocks/features/search/data/repositories/add_to_watchlist_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_search_event.dart';
part 'stock_search_state.dart';

class StockSearchBloc extends Bloc<StockSearchEvent, StockSearchState> {
  final SearchStocksRepository repository;

  StockSearchBloc(this.repository) : super(StockSearchInitial()) {
    on<SearchStocksEvent>((event, emit) async {
      emit(StockSearchLoading());
      try {
        final stocks = await repository.searchStocks(event.query);
        emit(StockSearchLoaded(stocks,event.query));
      } catch (error) {
        emit(StockSearchError(error.toString()));
      }
    });
  }
}

