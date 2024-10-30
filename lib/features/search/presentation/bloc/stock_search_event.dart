part of 'stock_search_bloc.dart';

@immutable
abstract class StockSearchEvent {}

class SearchStocksEvent extends StockSearchEvent {
  final String query;

  SearchStocksEvent(this.query);
}