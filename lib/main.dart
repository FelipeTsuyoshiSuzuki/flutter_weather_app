import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/views/weather_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: Provider.of<ThemeProvider>(context).themeDataStyle,
        darkTheme: Provider.of<ThemeProvider>(context).themeDataStyle,
        debugShowCheckedModeBanner: false,
        home: const WeatherView());
  }
}
