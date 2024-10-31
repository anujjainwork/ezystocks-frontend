import 'package:ezystocks/features/home/business/entities/user_stock_entity.dart';

class WatchListEntity{
  final int id;
  final UserStocksEntity stocksEntity;

  WatchListEntity(this.id, {required this.stocksEntity});
}