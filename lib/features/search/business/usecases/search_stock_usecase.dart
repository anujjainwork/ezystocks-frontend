import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';
import 'package:ezystocks/features/search/data/repositories/search_stock_repo_impl.dart';

class SearchStockUseCase {
  final SearchStocksRepositoryImpl repositoryImpl;
  SearchStockUseCase({required this.repositoryImpl});

  Future<List<SearchStocksEntity>> search(String query) {
    return repositoryImpl.searchStocks(query);
  }
}