import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';
import 'package:ezystocks/features/watchlist/business/usecases/watchlist_usecase.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetUserWatchlistUseCase getUserWatchlistUseCase;

  WatchlistBloc({required this.getUserWatchlistUseCase}) : super(WatchlistInitial()) {
    on<FetchWatchlistEvent>((event, emit) async {
      emit(WatchlistLoading()); // Emit loading state

      try {
        final watchlist = await getUserWatchlistUseCase.execute(); // Fetch data
        emit(WatchlistLoaded(watchlist: watchlist)); // Emit loaded state with data
      } catch (error) {
        emit(WatchlistError(error: error.toString())); // Emit error state with message
      }
    });
  }
}
