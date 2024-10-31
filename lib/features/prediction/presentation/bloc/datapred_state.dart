part of 'datapred_bloc.dart';

@immutable
sealed class DatapredState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DatapredInitial extends DatapredState {}

final class DatapredLoading extends DatapredState {}

final class DatapredLoaded extends DatapredState {
  final DataPredicitionResponseEntity dataPredicitionResponseEntity;
  final String date;
  DatapredLoaded(this.date, {required this.dataPredicitionResponseEntity});

  @override
  List<Object?> get props => [dataPredicitionResponseEntity];
}

final class DatapredError extends DatapredState {
  final String message;

  DatapredError({required this.message});

  @override
  List<Object?> get props => [message];
}

