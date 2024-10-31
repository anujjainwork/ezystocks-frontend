import 'dart:convert';
import 'package:ezystocks/features/prediction/data/models/data_pred_response_model.dart';
import 'package:ezystocks/features/prediction/data/models/data_predicition_model.dart';
import 'package:http/http.dart' as http;

class DataPredictionApiService {
  Future<DataPredicitionResponseModel> getPredicition(DataPredictionModel dataPredictionModel) async {
    try {
      final response = await http.post(
        Uri.parse('http://0.0.0.0:8000/predict'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dataPredictionModel.toJson()),  // Use jsonEncode for proper JSON formatting
      );

      if (response.statusCode == 200) {
        final respBody = jsonDecode(response.body); // Decode the JSON string
        return DataPredicitionResponseModel.fromJson(respBody);
      } else {
        throw Exception("Failed to add to watchlist: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Exception occurred: $e");
    }
  }
}