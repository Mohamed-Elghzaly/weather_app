import 'package:flutter/material.dart';

class WeatherModel {
  final double avgTemp1;
  final String state1;
  final String date1;
  final String image1;

  final double avgTemp2;
  final String state2;
  final String date2;
  final String image2;

  final double avgTemp3;
  final String state3;
  final String date3;
  final String image3;
  WeatherModel({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.avgTemp1,
    required this.state1,
    required this.date1,
    required this.avgTemp2,
    required this.state2,
    required this.date2,
    required this.avgTemp3,
    required this.state3,
    required this.date3,
  });

  factory WeatherModel.formjson(dynamic data) {
    var jsonData1 = data['forecast']['forecastday'][0]['day'];
    var jsonData2 = data['forecast']['forecastday'][1]['day'];
    var jsonData3 = data['forecast']['forecastday'][2]['day'];
    return WeatherModel(
      date1: data['forecast']['forecastday'][0]['date'],
      avgTemp1: jsonData1['avgtemp_c'],
      state1: jsonData1['condition']['text'],
      image1: jsonData1['condition']['icon'],
      date2: data['forecast']['forecastday'][1]['date'],
      avgTemp2: jsonData2['avgtemp_c'],
      state2: jsonData2['condition']['text'],
      image2: jsonData2['condition']['icon'],
      date3: data['forecast']['forecastday'][2]['date'],
      avgTemp3: jsonData3['avgtemp_c'],
      state3: jsonData3['condition']['text'],
      image3: jsonData3['condition']['icon'],
    );
  }

  MaterialColor getThemeColor() {
    if (state1 == 'Thunderstorm' || state1 == 'Thunder') {
      return Colors.grey;
    } else if (state1 == 'Snow' || state1 == 'Sleet' || state1 == 'Hail') {
      return Colors.blue;
    } else if (state1 == 'Heavy cloudy' ||
        state1 == 'Partly cloudy' ||
        state1 == 'Patchy rain possible') {
      return Colors.blueGrey;
    } else if (state1 == 'Light Rain' ||
        state1 == 'Heavy Rain' ||
        state1 == 'Showers' ||
        state1 == 'Moderate rain') {
      return Colors.blue;
    } else if (state1 == 'clear' || state1 == 'Light cloud') {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }
}
