import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';
import 'package:ezystocks/features/watchlist/business/repositories/watchlist_repo.dart';
import 'package:ezystocks/features/watchlist/data/repositories/watchlist_repo_impl.dart';

class GetUserWatchlistUseCase {
  final WatchlistRepositoryImpl watchlistRepository;

  GetUserWatchlistUseCase({required this.watchlistRepository});

  Future<List<WatchlistEntity>> execute() async {
    try {
      return await watchlistRepository.getUserWatchlist();
    } catch (e) {
      throw Exception('Failed to fetch user watchlist: $e');
    }
  }
}
