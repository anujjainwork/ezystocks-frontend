part of 'add_to_watchlist_bloc_bloc.dart';

@immutable
sealed class AddToWatchlistBlocEvent {}

class AddToWatchListEvent extends AddToWatchlistBlocEvent{
  final String symbol;

  AddToWatchListEvent({required this.symbol});
}