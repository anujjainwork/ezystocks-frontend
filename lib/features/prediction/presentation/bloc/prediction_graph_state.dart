part of 'prediction_graph_bloc.dart';

sealed class PredictionGraphState extends Equatable {
  const PredictionGraphState();
  
  @override
  List<Object> get props => [];
}

final class PredictionGraphInitial extends PredictionGraphState {}


final class PredictionGraphLoading extends PredictionGraphState {}

final class PredictionGraphLoaded extends PredictionGraphState {
  final List<StockHistoricalEntity> stockHistoricalData;
  final String symbol;

  const PredictionGraphLoaded({required this.stockHistoricalData,required this.symbol,});
}

final class PredictionGraphError extends PredictionGraphState {
  final String message;
  const PredictionGraphError(this.message);
}