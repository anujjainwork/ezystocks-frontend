import 'package:ezystocks/features/search/data/datasources/add_to_watchlist_api_service.dart';
import 'package:ezystocks/features/search/data/models/watchlist_model.dart';
import 'package:ezystocks/features/search/data/repositories/add_to_watchlist_repo_impl.dart';

class AddToWatchListUseCase{
  final AddToWatchlistRepositoryImpl repositoryImpl;

  AddToWatchListUseCase({required this.repositoryImpl});
  Future<void> add(String symbol){
    return repositoryImpl.addToWatchlist(symbol);
  }
}