import 'package:ezystocks/features/search/data/models/watchlist_model.dart';

abstract class AddToWatchlistRepository{
  Future<void> addToWatchlist(String symbol);
}