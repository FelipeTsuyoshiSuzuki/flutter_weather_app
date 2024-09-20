import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListItem extends StatelessWidget {
  final String cityName;
  final String description;
  final double temperature;

  const ListItem({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Lottie.asset('assets/sunny.json',
                width: 48, height: 48, fit: BoxFit.fill),
            title: Text(
              cityName ?? "",
            ),
            subtitle: Text(
              "$description}\n${temperature.toStringAsFixed(1)} \u2103",
            ),
          ),
        ],
      ),
    );
  }
}
