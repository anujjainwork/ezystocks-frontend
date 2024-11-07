import 'package:bloc/bloc.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/business/use_cases/home_usecases.dart';
import 'package:ezystocks/features/home/presentation/historical_data_bloc/stock_historical_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserStocksUseCase getUserStocksUseCase;
  final StockHistoricalBloc stockHistoricalBloc;

  HomeBloc(this.getUserStocksUseCase, this.stockHistoricalBloc) : super(HomeInitial()) {
    on<HomePortfolioDataFetchEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        print('inside homebloc calling api?');
        final UserStocksEntityList data = await getUserStocksUseCase.execute();
        emit(HomeLoaded(data.user_stocks));
        stockHistoricalBloc.add(StockHistoricalFetchDataEvent(symbol: data.user_stocks.first.symbol));
      } catch (error) {
        emit(HomeError('Failed to load portfolio data'));
      }
    });
  }
}