import 'package:flutter/material.dart';
import 'package:weather_app/utils/lottie_setter.dart';

class ListItem extends StatelessWidget {
  final String cityName;
  final String description;
  final String main;
  final double temperature;

  const ListItem({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.main,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: LottieSetter(main),
            title: Text(
              cityName,
            ),
            subtitle: Text(
              "$description\n${temperature.toStringAsFixed(1)} \u2103",
            ),
          ),
        ],
      ),
    );
  }
}
