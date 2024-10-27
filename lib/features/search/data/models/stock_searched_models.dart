import 'package:ezystocks/core/constants/constants.dart';
import 'package:ezystocks/features/search/business/entities/search_stock_entity.dart';

class SearchStocksModel extends SearchStocksEntity {
  SearchStocksModel({required super.name, required super.symbol});

factory SearchStocksModel.fromJson(Map<String, dynamic> json) {
  return SearchStocksModel(
    name: json['name'] ?? '',
    symbol: json['symbol'] ?? '',
    );
}
}
