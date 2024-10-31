import 'package:ezystocks/features/prediction/business/entities/data_pred_response_entity.dart';
import 'package:ezystocks/features/prediction/business/repositories/data_pred_repo.dart';
import 'package:ezystocks/features/prediction/data/datasources/data_prediction_api_service.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';

class DataPredictionRepositoryImpl implements DataPredictionRepository {
  final DataPredictionApiService apiService = DataPredictionApiService();

  @override
  Future<DataPredicitionResponseEntity> getStockPrediction(
      DataPredictionModel dataPredictionModel) async {
    try {
      final responseModel =
          await apiService.getPredicition(dataPredictionModel);

      final dataEntity = responseModel.toEntity();

      return dataEntity;
    } catch (e) {
      throw Exception("Error fetching stock prediction: $e");
    }
  }
}
