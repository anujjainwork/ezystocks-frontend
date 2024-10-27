import 'dart:convert';
import 'package:ezystocks/core/base_urls.dart';
import 'package:ezystocks/features/search/data/models/stock_searched_models.dart';
import 'package:http/http.dart' as http;

class StockSearchApiService {
  final baseUrl = BaseUrls.baseUrl_backend;
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3IiwidXNlcm5hbWUiOiIyd2YiLCJpYXQiOjE3MzAwNTAxMjV9.jGkzrQrXRTh8PkZWIj8n5wJ2RW2Z1nn7dTTGPQPbIjQ';

  Future<List<SearchStocksModel>> fetchSearchedStocks(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search/query?query=$query'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List stocksData = data['respBody'] ?? [];

        return stocksData.map((item) => SearchStocksModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch stocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching stocks: $e');
    }
  }
}
