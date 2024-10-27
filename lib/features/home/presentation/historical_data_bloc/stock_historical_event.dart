part of 'stock_historical_bloc.dart';

@immutable
sealed class StockHistoricalEvent {}

class StockHistoricalFetchDataEvent extends StockHistoricalEvent{
  final String symbol;

  StockHistoricalFetchDataEvent({required this.symbol});
}
