part of 'prediction_graph_bloc.dart';

sealed class PredictionGraphEvent extends Equatable {
  const PredictionGraphEvent();

  @override
  List<Object> get props => [];
}

class PredictionGraphFetchDataEvent extends PredictionGraphEvent{
  final String symbol;

  const PredictionGraphFetchDataEvent({required this.symbol});
}