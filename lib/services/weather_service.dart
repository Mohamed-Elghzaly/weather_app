import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String apiKey = '23fc63aa38ba461db1a114447231202';
  String urlBase = 'http://api.weatherapi.com/v1';

  Future<WeatherModel?> fetchWeatherData({required String cityName}) async {
    // cityName = 'london';
    WeatherModel? weatherData;
    try {
      Uri url =
          Uri.parse('$urlBase/forecast.json?key=$apiKey&q=$cityName&days=3');

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherData = WeatherModel.formjson(data);
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint(weatherData.toString());
    return weatherData;
  }
}
