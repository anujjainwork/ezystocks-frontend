part of 'stock_search_bloc.dart';

@immutable
abstract class StockSearchEvent {}

class SearchStocks extends StockSearchEvent {
  final String query;

  SearchStocks(this.query);
}
