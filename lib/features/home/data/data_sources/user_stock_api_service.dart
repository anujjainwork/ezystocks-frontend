import 'dart:convert';

import 'package:ezystocks/core/base_urls.dart';
import 'package:ezystocks/features/home/data/models/user_stocks_model.dart';
import 'package:ezystocks/features/home/data/models/users_stocks_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserStocksApiService {
  final base_url = BaseUrls.baseUrl_backend;
  String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3IiwidXNlcm5hbWUiOiIyd2YiLCJpYXQiOjE3Mjk5NjIzNTd9.SF3ZJwCspOxM1S05q_vcQi4AFcWxFfcbSmb0nZPfpls';
  Future<UserStocksModelList> fetchUserStocks() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? accessToken = prefs.getString('accessToken');

      final response = await http.get(
        Uri.parse('${base_url}/portfolio/user'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<UserStocksModel> userStocks = (data['respBody'] as List)
            .map((item) => UserStocksModel.fromJson(item['stock']))
            .toList();
        print('user stocks api called, data -> ${userStocks}');
        return UserStocksModelList(user_stocks: userStocks);
      } else {
        throw Exception('Failed to fetch stocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
