import 'package:ezystocks/features/home/data/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/data/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/domain/models/user_stocks_model.dart';

abstract class HomeStocksDataRepository{
  Future<UserStocksModel> getUserStocksData();
  Future<StockHistoricalEntity> getStocksData(String symbol);
  Future<UserStocksEntityList> addStocksDataList();
}