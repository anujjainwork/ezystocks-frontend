

import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';
import 'package:ezystocks/features/search/business/repositories/search_stock_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_search_event.dart';
part 'stock_search_state.dart';

class StockSearchBloc extends Bloc<StockSearchEvent, StockSearchState> {
  final SearchStocksRepository repository;

  StockSearchBloc(this.repository) : super(StockSearchInitial()) {
    on<SearchStocks>((event, emit) async {
      emit(StockSearchLoading());
      try {
        final stocks = await repository.searchStocks(event.query);
        emit(StockSearchLoaded(stocks));
      } catch (error) {
        emit(StockSearchError(error.toString()));
      }
    });
  }
}

