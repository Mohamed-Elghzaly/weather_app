import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_me/models/weather_model.dart';
import 'package:weather_me/pages/widgets/weather_days.dart';
import 'package:weather_me/pages/widgets/weather_search.dart';
import '../../weather_cubit/weather_cubit.dart';

class WeatherPageBody extends StatelessWidget {
  const WeatherPageBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 1300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[400]!,
              weatherData!.getThemeColor()[100]!,
            ], begin: Alignment.topCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
               WeatherSearch( color: Colors.white),
              const SizedBox(
                height: 100,
              ),
              Text(
                BlocProvider.of<WeatherCubit>(context).cityName!,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                weatherData!.state1,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.network(
                'https:${weatherData!.image1}',
                scale: .2,
              ),
              Text(
                weatherData!.avgTemp1.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                weatherData!.date1.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              WeatherDays(
                avgTemp: weatherData!.avgTemp2.toString(),
                date: weatherData!.date2,
                image: Image.network('https:${weatherData!.image2}'),
              ),
              WeatherDays(
                avgTemp: weatherData!.avgTemp3.toString(),
                date: weatherData!.date3,
                image: Image.network('https:${weatherData!.image3}'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
