import 'dart:async';

import 'package:dicoding_rest_api/data/api/api_service.dart';
import 'package:dicoding_rest_api/data/model/restaurant_detail.dart';
import 'package:flutter/material.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchAllArticle(id);
  }

  late RestaurantDetail _detailResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetail get result => _detailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle(id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.listdetail(id);
      if (restaurant.restaurant.id.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Restaurant Detail Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Check your internet connection, Dicoding restaurant needs to be online';
    }
  }
}
