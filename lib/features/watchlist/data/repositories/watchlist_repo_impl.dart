import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';
import 'package:ezystocks/features/watchlist/business/repositories/watchlist_repo.dart';
import 'package:ezystocks/features/watchlist/data/datasources/watchlist_apiservice.dart';
import 'package:ezystocks/features/watchlist/data/models/watchlist_model.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistApiService apiService = WatchlistApiService();
  @override
  Future<List<WatchlistEntity>> getUserWatchlist() async {
    try {
      final List<WatchlistModel> watchlistModels =
          await apiService.fetchUserWatchlist();

      final List<WatchlistEntity> watchlistEntities =
          watchlistModels.map((model) {
        return WatchlistEntity(
          symbol: model.symbol,
          currentPrice: model.currentPrice, name: model.name,
        );
      }).toList();

      return watchlistEntities;
    } catch (e) {
      throw Exception('Failed to load watchlist: $e');
    }
  }
}
