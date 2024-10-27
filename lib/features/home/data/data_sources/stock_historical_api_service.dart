import 'dart:convert';
import 'package:ezystocks/features/home/domain/models/stock_historical_model.dart';
import 'package:http/http.dart' as http;

class StockHistoricalApiService {
  String baseUrl = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY';

  Future<List<StockHistoricalModel>> fetchHistoricalData(String symbol) async {
    final response = await http.get(Uri.parse('$baseUrl&symbol=${symbol}&apikey=DIPUEX37XOHOIKFH'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> timeSeries = data["Time Series (Daily)"];
      
      List<StockHistoricalModel> historicalData = [];
      
      int count = 0;
      for (var entry in timeSeries.entries) {
        if (count >= 100) break;  // Stop after 30 entries
        final date = entry.key;
        final value = entry.value as Map<String, dynamic>;
                historicalData.add(StockHistoricalModel.fromJson(value, date));
        count++;
      }

      return historicalData;
    } else {
      throw Exception('Failed to load historical data');
    }
  }
}
