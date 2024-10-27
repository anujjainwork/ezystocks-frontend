part of 'stock_search_bloc.dart';

@immutable
abstract class StockSearchState {}

class StockSearchInitial extends StockSearchState {}

class StockSearchLoading extends StockSearchState {}

class StockSearchLoaded extends StockSearchState {
  final List<SearchStocksEntity> stockLists;

  StockSearchLoaded(this.stockLists);
}

class StockSearchError extends StockSearchState {
  final String errorMessage;

  StockSearchError(this.errorMessage);
}
