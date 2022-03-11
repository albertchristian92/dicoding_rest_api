import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dicoding_rest_api/data/model/list_restaurant.dart';
import 'package:dicoding_rest_api/data/model/restaurant_detail.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<Welcome> restaurantList() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));

    if (response.statusCode == 200) {
      return Welcome.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<Detail> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/' + id));

    if (response.statusCode == 200) {
      return Detail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant Detail');
    }
  }

}