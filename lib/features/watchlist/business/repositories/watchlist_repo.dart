import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';

abstract class WatchlistRepository{
  Future<List<WatchlistEntity>> getUserWatchlist();
}