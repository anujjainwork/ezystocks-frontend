import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/business/use_cases/historical_data_usecases.dart';
import 'package:ezystocks/features/home/business/use_cases/home_usecases.dart';

part 'prediction_graph_event.dart';
part 'prediction_graph_state.dart';

class PredictionGraphBloc
    extends Bloc<PredictionGraphEvent, PredictionGraphState> {
  final GetHistoricalUseCase getHistoricalUseCase;

  PredictionGraphBloc(this.getHistoricalUseCase)
      : super(PredictionGraphInitial()) {
    on<PredictionGraphFetchDataEvent>((event, emit) async {
      emit(PredictionGraphLoading());
      try {
        final stockHistoricalData =
            await getHistoricalUseCase.execute(event.symbol);
        emit(PredictionGraphLoaded(
            stockHistoricalData: stockHistoricalData, symbol: event.symbol));
      } catch (e) {
        emit(PredictionGraphError("Error fetching stock historical data"));
        throw Exception(e);
      }
    });
  }
}
