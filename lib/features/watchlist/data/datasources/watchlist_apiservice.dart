import 'dart:convert';
import 'package:ezystocks/core/base_urls.dart';
import 'package:ezystocks/features/watchlist/data/models/watchlist_model.dart';
import 'package:http/http.dart' as http;

class WatchlistApiService {
  final baseUrl = BaseUrls.baseUrl_backend;

  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3IiwidXNlcm5hbWUiOiIyd2YiLCJpYXQiOjE3Mjk5NjIzNTd9.SF3ZJwCspOxM1S05q_vcQi4AFcWxFfcbSmb0nZPfpls';

  Future<List<WatchlistModel>> fetchUserWatchlist() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/watchlist/get-watchlist'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<WatchlistModel> userStocks = (data['respBody'] as List)
            .map((item) => WatchlistModel.fromJson(item['stock']))
            .toList();
        print('User stocks API called, data -> $userStocks');
        return userStocks;
      } else {
        throw Exception('Failed to fetch stocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
