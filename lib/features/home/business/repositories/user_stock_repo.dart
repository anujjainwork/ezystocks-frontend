import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/business/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/data/models/user_stocks_model.dart';

abstract class HomeStocksDataRepository{
  Future<UserStocksModel> getUserStocksData();
  Future<StockHistoricalEntity> getStocksData(String symbol);
  Future<UserStocksEntityList> addStocksDataList();
}