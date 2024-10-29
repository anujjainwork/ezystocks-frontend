import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';

abstract class StockHistoricalDataRepo{
  Future<List<StockHistoricalEntity>> getHistoricalData(String symbol);
}