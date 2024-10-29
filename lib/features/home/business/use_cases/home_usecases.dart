import 'package:ezystocks/features/home/business/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/data/models/users_stocks_list_model.dart';
import 'package:ezystocks/features/home/business/repositories/user_stock_repo.dart';

class GetUserStocksUseCase {
  final HomeStocksDataRepository repository;

  GetUserStocksUseCase(this.repository);

  Future<UserStocksEntityList> execute() {
    return repository.addStocksDataList();
  }
}