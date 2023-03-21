import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_me/pages/widgets/weather_page_body.dart';
import 'package:weather_me/pages/widgets/weather_search.dart';
import 'package:weather_me/weather_cubit/weather_cubit.dart';

import '../models/weather_model.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  WeatherModel? weatherData;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    // cityName = BlocProvider.of<WeatherCubit>(context).cityName;
    // BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return WeatherPageBody(
              weatherData: weatherData,
            );
          } else if (state is WeatherFailure) {
            return Text('Something went wrong ${state.errMessege}');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WeatherSearch(color: Colors.black),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'there is no weather 😔 start ',
                        style: TextStyle(fontSize: 48),
                      ),
                      Text(
                        'searching now 🔍',
                        style: TextStyle(fontSize: 48),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
