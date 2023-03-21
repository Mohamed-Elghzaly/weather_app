import 'package:flutter/material.dart';

class WeatherDays extends StatelessWidget {
  const WeatherDays(
      {super.key,
      required this.avgTemp,
      required this.date,
      required this.image});

  final String avgTemp;
  final String date;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          indent: 50,
          endIndent: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            image,
            Text(
              avgTemp,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
