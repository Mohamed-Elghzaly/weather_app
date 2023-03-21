import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_me/pages/weather_page.dart';
import 'package:weather_me/services/weather_service.dart';
import 'package:weather_me/weather_cubit/weather_cubit.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherHome(),
    );
  }
}
