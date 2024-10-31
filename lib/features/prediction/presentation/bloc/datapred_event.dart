part of 'datapred_bloc.dart';

@immutable
sealed class DatapredEvent extends Equatable{}

class FetchDataPrediction extends DatapredEvent {
  final DataPredictionModel dataPredictionModel;

  FetchDataPrediction(this.dataPredictionModel);

  @override
  List<Object> get props => [dataPredictionModel];
}

class SetDatapredInitialEvent extends DatapredEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}