import 'package:ezystocks/core/constants/constants.dart';
import 'package:ezystocks/features/prediction/business/entities/data_prediction_entity.dart';

class DataPredictionModel extends DataPredictionEntity {
  DataPredictionModel({
    required super.symbol,
    required super.date,
  });

  Map<String, dynamic> toJson() {
    return {
      ksymbol: symbol,
      kdate: date,
    };
  }

  factory DataPredictionModel.fromJson(Map<String, dynamic> json) {
    return DataPredictionModel(
      symbol: json['symbol'],
      date: json['date'],
    );
  }
}
