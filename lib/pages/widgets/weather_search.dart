import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../weather_cubit/weather_cubit.dart';

// ignore: must_be_immutable
class WeatherSearch extends StatelessWidget {
  WeatherSearch({super.key, required this.color});


  Color? color;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: TextField(
          onSubmitted: (data) async {
            cityName = data;

            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: cityName!);

            BlocProvider.of<WeatherCubit>(context).cityName = cityName;
          },
          decoration: InputDecoration(
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 45, horizontal: 40),
            labelText: 'search',
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: color!)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: color!)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: color!)),
            hintText: 'Enter a City',
          ),
        ),
      ),
    );
  }
}
