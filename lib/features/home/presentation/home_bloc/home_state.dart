part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<UserStocksEntity> userStocks;
  HomeLoaded(this.userStocks);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}