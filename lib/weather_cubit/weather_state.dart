part of 'weather_cubit.dart';

abstract class WeatherState {}


class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {
  String errMessege;
  WeatherFailure({required this.errMessege});
}