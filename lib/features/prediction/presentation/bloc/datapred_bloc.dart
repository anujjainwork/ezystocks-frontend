import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ezystocks/features/home/presentation/home_bloc/home_bloc.dart';
import 'package:ezystocks/features/prediction/business/entities/data_pred_response_entity.dart';
import 'package:ezystocks/features/prediction/business/usecases/data_pred_usecase.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/prediction_graph_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'datapred_event.dart';
part 'datapred_state.dart';

class DatapredBloc extends Bloc<DatapredEvent, DatapredState> {
  final GetStockPredictionUseCase getStockPredictionUseCase;
  final PredictionGraphBloc predictionGraphBloc; // Inject PredictionGraphBloc

  DatapredBloc({
    required this.getStockPredictionUseCase,
    required this.predictionGraphBloc, // Add this parameter
  }) : super(DatapredInitial()) {
    on<FetchDataPrediction>((event, emit) async {
      emit(DatapredLoading());
      try {
        final dataPredicitionResponseEntity =
            await getStockPredictionUseCase.execute(event.dataPredictionModel);
        emit(DatapredLoaded(
            dataPredicitionResponseEntity: dataPredicitionResponseEntity,event.dataPredictionModel.date));

        predictionGraphBloc.add(PredictionGraphFetchDataEvent(
            symbol: event
                .dataPredictionModel.symbol));
      } catch (e) {
        emit(DatapredError(message: e.toString()));
      }
    });
    on<SetDatapredInitialEvent>((event, emit) {
      emit(DatapredInitial());
    });
  }
}
