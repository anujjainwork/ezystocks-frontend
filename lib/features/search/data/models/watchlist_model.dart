import 'package:ezystocks/core/constants/constants.dart';
import 'package:ezystocks/features/search/business/entities/watchlist_entity.dart';

class WatchListModel extends WatchListEntity {
  WatchListModel(super.id, {required super.stocksEntity});

  Map<String,dynamic> toJson(){
    return {
        kstock: {
        ksymbol: stocksEntity.symbol,
        kname: stocksEntity.name,
        kcurrentPrice : stocksEntity.currentPrice
    }
    };
  }
}
