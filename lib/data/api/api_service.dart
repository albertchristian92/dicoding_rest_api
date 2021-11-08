import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dicoding_rest_api/data/model/restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantsResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "list"));
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant');
    }
  }
}
