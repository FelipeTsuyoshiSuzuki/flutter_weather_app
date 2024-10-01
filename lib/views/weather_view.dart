import 'dart:core';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/list_item.dart';
import 'package:weather_app/services/weather_sevice.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/utils/global_theme.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _service = WeatherService(apiKey: "2899bd476324bf6f3ac7a31fab4d5c75");
  final _textController = TextEditingController();
  late List<Weather> weatherList;
  late Future<List<Weather>?> _weatherList;
  final List<String> _cities = [
    'Rio de Janeiro',
    'Brasília',
    'Fortaleza',
    'Salvador',
    'Belo Horizonte',
    'Manaus',
    'Curitiba',
    'Recife',
    'Goiânia',
    'Tóquio',
    'Jacarta',
    'Deli',
    'Manila',
    'Seul',
    'Xangai',
    'Carachi',
    'Pequim',
    'Nova Iorque',
    'Guangzhou',
    'Cidade do México',
    'Mumbai',
    'Osaka',
    'Moscou',
    'Dhaca',
    'Cairo',
    'Los Angeles',
    'Bangkok',
    'Calcutá'
  ];

  @override
  void initState() {
    super.initState();
    weatherList = [];
    _weatherList = populateWeatherList();
  }

  Future<List<Weather>?> _searchWeather({required String searchCity}) async {
    try {
      var response = await _service.getWeather(searchCity);
      weatherList.insert(0, response);
    } catch (e) {
      log(e.toString());
    }
    return weatherList;
  }

  Future<List<Weather>?> populateWeatherList() async {
    if (weatherList.isEmpty) {
      String cityName = await _service.getCurrentCity();
      _cities.insert(0, cityName);
    }
    for (int i = 0; i < _cities.length; i++) {
      try {
        var response = await _service.getWeather(_cities[i]);
        weatherList.add(response);
      } catch (e) {
        log(e.toString());
      }
    }
    return weatherList;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final IconData icon = themeProvider.themeDataStyle ==
            GlobalTheme(GlobalTextTheme.globalTextTheme).light()
        ? Icons.nightlight_round
        : Icons.sunny;
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 130,
        floating: true,
        pinned: false,
        title: const Text("CLIMA"),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Digite uma cidade",
                      prefixIcon: const Icon(Icons.home),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _weatherList = _searchWeather(
                                  searchCity: _textController.text);
                            });
                          },
                          icon: const Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                themeProvider.changeTheme();
                log("Alterar Tema");
              },
              icon: Icon(icon),
            ),
          )
        ],
      ),
      FutureBuilder(
        future: _weatherList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text("Error"),
                ),
              );
            case ConnectionState.waiting:
              return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            default:
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = weatherList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListItem(
                        cityName: item.cityName,
                        temperature: item.temperature,
                        description: item.description,
                        main: item.mainConditions,
                      ),
                    );
                  },
                  childCount: weatherList.length,
                ),
              );
          }
        },
      ),
    ]));
  }
}
