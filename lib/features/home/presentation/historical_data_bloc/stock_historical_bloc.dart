import 'package:bloc/bloc.dart';
import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';
import 'package:ezystocks/features/home/business/use_cases/historical_data_usecases.dart';
import 'package:meta/meta.dart';

part 'stock_historical_event.dart';
part 'stock_historical_state.dart';

class StockHistoricalBloc extends Bloc<StockHistoricalEvent, StockHistoricalState> {
  final GetHistoricalUseCase getHistoricalUseCase;

  StockHistoricalBloc(this.getHistoricalUseCase) : super(StockHistoricalInitial()) {
    on<StockHistoricalFetchDataEvent>((event, emit) async {
      emit(StockHistoricalLoading());
      try{
        final stockHistoricalData = await getHistoricalUseCase.execute(event.symbol);
        emit(StockHistoricalLoaded(stockHistoricalData: stockHistoricalData,symbol: event.symbol));
      }
      catch(e){
        emit(StockHistoricalError("Error fetching stock historical data"));
        throw Exception(e);
      }
    });
  }
}
