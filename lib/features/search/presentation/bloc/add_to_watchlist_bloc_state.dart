part of 'add_to_watchlist_bloc_bloc.dart';

@immutable
sealed class AddToWatchlistBlocState {}

final class AddToWatchlistBlocInitial extends AddToWatchlistBlocState {}

class WaitingToAddWatchList extends AddToWatchlistBlocState{}

class AddedToWatchList extends AddToWatchlistBlocState{}

class AddedToWatchlistError extends AddToWatchlistBlocState{
  final String errorMessage;

  AddedToWatchlistError({required this.errorMessage});
}