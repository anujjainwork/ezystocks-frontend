import 'package:ezystocks/features/prediction/business/entities/data_pred_response_entity.dart';

class DataPredicitionResponseModel extends DataPredicitionResponseEntity {
  DataPredicitionResponseModel(
      {required super.openPrice,
      required super.closePrice,
      required super.highPrice,
      required super.lowPrice});

  factory DataPredicitionResponseModel.fromJson(Map<String, dynamic> map) {
    return DataPredicitionResponseModel(
        openPrice: map['predicted_open'],
        closePrice: map['predicted_close'],
        highPrice: map['predicted_high'],
        lowPrice: map['predicted_low']);
  }
  
  DataPredicitionResponseEntity toEntity() {
    return DataPredicitionResponseEntity(
      openPrice: openPrice,
      closePrice: closePrice,
      highPrice: highPrice,
      lowPrice: lowPrice
    );
  }
}
