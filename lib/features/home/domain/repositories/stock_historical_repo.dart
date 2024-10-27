import 'package:ezystocks/features/home/data/entities/stock_historical_entity.dart';

abstract class StockHistoricalDataRepo{
  Future<List<StockHistoricalEntity>> getHistoricalData(String symbol);
}