import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_me/models/weather_model.dart';
import '../services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName ;

  void printf() {
    debugPrint(weatherModel.toString());
  }

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.fetchWeatherData(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(WeatherFailure(
        errMessege: e.toString(),
      ));
    }
  }
}
