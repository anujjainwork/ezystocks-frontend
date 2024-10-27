part of 'stock_historical_bloc.dart';

@immutable
sealed class StockHistoricalState {}

final class StockHistoricalInitial extends StockHistoricalState {}


final class StockHistoricalLoading extends StockHistoricalState {}

final class StockHistoricalLoaded extends StockHistoricalState {
  final List<StockHistoricalEntity> stockHistoricalData;
  final String symbol;

  StockHistoricalLoaded({required this.stockHistoricalData,required this.symbol,});
}

final class StockHistoricalError extends StockHistoricalState {
  final String message;
  StockHistoricalError(this.message);
}
