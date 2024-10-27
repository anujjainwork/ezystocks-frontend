import 'package:ezystocks/features/home/data/data_sources/user_stock_api_service.dart';
import 'package:ezystocks/features/home/data/entities/stock_historical_entity.dart';
import 'package:ezystocks/features/home/data/entities/user_stock_entity.dart';
import 'package:ezystocks/features/home/data/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/domain/models/stock_historical_model.dart';
import 'package:ezystocks/features/home/domain/models/user_stocks_model.dart';
import 'package:ezystocks/features/home/domain/models/users_stocks_list_model.dart';
import 'package:ezystocks/features/home/domain/repositories/user_stock_repo.dart';

class HomeStocksDataRepositoryImpl extends HomeStocksDataRepository{
  
  final UserStocksApiService _userStocksApiService = new UserStocksApiService();

  @override
  Future<UserStocksEntityList> addStocksDataList() async {
    // Fetch data and deserialize into `UserStocksModel`
    final UserStocksModelList stocksListModel = await _userStocksApiService.fetchUserStocks();
    
    // Convert models to entities for the domain layer
    final userStocksEntities = stocksListModel.user_stocks
        .map((model) => UserStocksEntity(
              symbol: model.symbol,
              name: model.name,
              currentPrice: model.currentPrice,
            ))
        .toList();

    return UserStocksEntityList(user_stocks: userStocksEntities);
  }

  @override
  Future<StockHistoricalEntity> getStocksData(String symbol) {
    throw UnimplementedError();
  }

  @override
  Future<UserStocksModel> getUserStocksData() {
   throw UnimplementedError();
  }

}
