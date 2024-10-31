import 'package:ezystocks/features/prediction/business/entities/data_pred_response_entity.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';

abstract class DataPredictionRepository{
  Future<DataPredicitionResponseEntity> getStockPrediction(DataPredictionModel dataPredictionModel);
}