import 'package:bloc/bloc.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/business/use_cases/home_usecases.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserStocksUseCase getUserStocksUseCase;

  HomeBloc(this.getUserStocksUseCase) : super(HomeInitial()) {
    on<HomePortfolioDataFetchEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        print('inside homebloc calling api?');
        final UserStocksEntityList data = await getUserStocksUseCase.execute();
        emit(HomeLoaded(data.user_stocks));
      } catch (error) {
        emit(HomeError('Failed to load portfolio data'));
      }
    });
  }
}