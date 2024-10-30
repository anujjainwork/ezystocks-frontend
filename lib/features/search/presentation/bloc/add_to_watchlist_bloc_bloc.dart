import 'package:bloc/bloc.dart';
import 'package:ezystocks/features/search/business/repositories/add_to_watchlist_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_watchlist_bloc_event.dart';
part 'add_to_watchlist_bloc_state.dart';

class AddToWatchlistBloc extends Bloc<AddToWatchlistBlocEvent, AddToWatchlistBlocState> {

  final AddToWatchlistRepository addToWatchlistRepository;

  AddToWatchlistBloc(this.addToWatchlistRepository) : super(AddToWatchlistBlocInitial()) {
    on<AddToWatchListEvent>((event, emit) async {
      try {
        await addToWatchlistRepository.addToWatchlist(event.symbol);
        emit(AddedToWatchList());
      } catch (error) {
        emit(AddedToWatchlistError(errorMessage: error.toString()));
      }
    });
  }
}
