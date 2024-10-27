import 'package:ezystocks/features/home/data/entities/user_stock_entity_list.dart';
import 'package:ezystocks/features/home/domain/models/users_stocks_list_model.dart';
import 'package:ezystocks/features/home/domain/repositories/user_stock_repo.dart';

class GetUserStocksUseCase {
  final HomeStocksDataRepository repository;

  GetUserStocksUseCase(this.repository);

  Future<UserStocksEntityList> execute() {
    return repository.addStocksDataList();
  }
}