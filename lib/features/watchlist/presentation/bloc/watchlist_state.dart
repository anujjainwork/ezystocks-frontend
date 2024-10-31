part of 'watchlist_bloc.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

final class WatchlistInitial extends WatchlistState {}

final class WatchlistLoading extends WatchlistState {}

final class WatchlistLoaded extends WatchlistState {
  final List<WatchlistEntity> watchlist;

  const WatchlistLoaded({required this.watchlist});

  @override
  List<Object> get props => [watchlist];
}

final class WatchlistError extends WatchlistState {
  final String error;

  const WatchlistError({required this.error});

  @override
  List<Object> get props => [error];
}

