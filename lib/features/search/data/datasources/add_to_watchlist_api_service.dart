import 'dart:convert';

import 'package:ezystocks/core/base_urls.dart';
import 'package:ezystocks/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class AddToWatchlistApiService{
  final baseUrl = BaseUrls.baseUrl_backend;
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3IiwidXNlcm5hbWUiOiIyd2YiLCJpYXQiOjE3MzAwNTAxMjV9.jGkzrQrXRTh8PkZWIj8n5wJ2RW2Z1nn7dTTGPQPbIjQ';
  
  Future<void> addToWatchlist(String symbol) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/watchlist/add-to-watchlist'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',  // specify JSON content type
        },
        body: jsonEncode({
          kstock: {
            ksymbol: symbol,
          }
        }),
      );

      if (response.statusCode == 200) {
        print("Watchlist item added successfully: ${response.body}");
      } else {
        print("Failed to add watchlist item: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to add to watchlist: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error adding to watchlist: $e");
      throw Exception("Exception occurred: $e");
    }
  }
}