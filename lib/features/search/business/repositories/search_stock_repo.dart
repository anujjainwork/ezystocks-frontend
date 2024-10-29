import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';

abstract class SearchStocksRepository{

  Future<List<SearchStocksEntity>> searchStocks(String query);
}