import 'package:ezystocks/features/home/data/data_sources/stock_historical_api_service.dart';
import 'package:ezystocks/features/home/data/models/stock_historical_model.dart';
import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/business/repositories/stock_historical_repo.dart';

class StockHistoricalRepositoryImpl implements StockHistoricalDataRepo {
  final StockHistoricalApiService apiService = StockHistoricalApiService();


  @override
  Future<List<StockHistoricalEntity>> getHistoricalData(String symbol) async {
    final List<StockHistoricalModel> historicalDataModel =
        await apiService.fetchHistoricalData(symbol);

    final List<StockHistoricalEntity> historicalDataEntities =
        historicalDataModel.map((model) {
      return StockHistoricalEntity(
        date: model.date,
        openPrice: model.openPrice,
        highPrice: model.highPrice,
        lowPrice: model.lowPrice,
        closePrice: model.closePrice,
        volume: model.volume,
      );
    }).toList();

    return historicalDataEntities;
  }
}
