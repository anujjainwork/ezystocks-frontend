import 'package:ezystocks/features/home/business/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/data/repositories/stock_historical_repo_impl.dart';

class GetHistoricalUseCase{
  final StockHistoricalRepositoryImpl stockHistoricalRepositoryImpl;

  GetHistoricalUseCase({required this.stockHistoricalRepositoryImpl});

  Future<List<StockHistoricalEntity>> execute(String symbol) {
    return stockHistoricalRepositoryImpl.getHistoricalData(symbol);
  }
}