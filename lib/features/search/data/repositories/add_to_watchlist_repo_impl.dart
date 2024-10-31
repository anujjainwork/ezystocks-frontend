import 'package:ezystocks/features/search/business/repositories/add_to_watchlist_repo.dart';
import 'package:ezystocks/features/search/data/datasources/add_to_watchlist_api_service.dart';
import 'package:ezystocks/features/search/data/models/watchlist_model.dart';

class AddToWatchlistRepositoryImpl implements AddToWatchlistRepository{
  final AddToWatchlistApiService watchlistApiService = new AddToWatchlistApiService();

  AddToWatchlistRepositoryImpl();
  
  @override
  Future<void> addToWatchlist(String symbol) async {
    try {
      await watchlistApiService.addToWatchlist(symbol);
      print("Watchlist item added successfully.");
    } catch (e) {
      print("Failed to add watchlist item: $e");
      throw Exception("Error adding to watchlist: $e");
    }
  }
}
