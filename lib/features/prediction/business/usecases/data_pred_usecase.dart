import 'package:ezystocks/features/prediction/business/entities/data_pred_response_entity.dart';
import 'package:ezystocks/features/prediction/business/repositories/data_pred_repo.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';

class GetStockPredictionUseCase {
  final DataPredictionRepository repository;

  GetStockPredictionUseCase({required this.repository});

  Future<DataPredicitionResponseEntity> execute(
      DataPredictionModel dataPredictionModel) async {
    try {
      final prediction =
          await repository.getStockPrediction(dataPredictionModel);
          print('prediction.closeprice - ${prediction.closePrice}');
      return prediction;
    } catch (e) {
      throw Exception("Error retrieving stock prediction: $e");
    }
  }
}
