import 'package:ezystocks/core/constants/constants.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';

class UserStocksModel extends UserStocksEntity {
  UserStocksModel(
      {required super.symbol,
      required super.name,
      required super.currentPrice});
  
  factory UserStocksModel.fromJson(Map<String,dynamic> map){
    return UserStocksModel(symbol: map[ksymbol],
    name: map[kname],
    currentPrice: map[kcurrentPrice]);
  }

  Map<String,dynamic> toJson(UserStocksModel userStocksModel){
    return {
      ksymbol:userStocksModel.symbol,
      kname:userStocksModel.name,
      kcurrentPrice:userStocksModel.currentPrice,
    };
  }
}
