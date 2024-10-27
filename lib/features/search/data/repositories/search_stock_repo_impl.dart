import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';
import 'package:ezystocks/features/search/business/repositories/search_stock_repo.dart';
import 'package:ezystocks/features/search/data/datasources/stock_search_api_service.dart';
import 'package:ezystocks/features/search/data/models/stock_searched_models.dart';

class SearchStocksRepositoryImpl implements SearchStocksRepository{
  StockSearchApiService _apiService = new StockSearchApiService();
  @override
  Future<List<SearchStocksEntity>> searchStocks(String query) async {
    List<SearchStocksModel> searchStocksModel = await _apiService.fetchSearchedStocks(query);

    return searchStocksModel.map((model) {
      return SearchStocksEntity(
        name: model.name,
        symbol: model.symbol,
      );
    }).toList();
  }

}