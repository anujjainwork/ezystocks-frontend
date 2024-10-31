import 'package:ezystocks/core/constants/constants.dart';
import 'package:ezystocks/features/search/business/entities/watchlist_entity.dart';
import 'package:ezystocks/features/search/data/models/watchlist_model.dart';
import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';

class WatchlistModel extends WatchlistEntity {
  WatchlistModel(
      {required super.symbol,
      required super.name,
      required super.currentPrice});

  factory WatchlistModel.fromJson(Map<String, dynamic> map) {
    return WatchlistModel(
        symbol: map['symbol'],
        name: map['name'],
        currentPrice: map['currentPrice']);
  }
  
  Map<String, dynamic> toJson(WatchlistModel watchlistModel) {
    return {
      ksymbol: watchlistModel.symbol,
      kname: watchlistModel.name,
      kcurrentPrice: watchlistModel.currentPrice,
    };
  }
}
