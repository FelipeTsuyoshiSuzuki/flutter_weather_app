import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/list_item.dart';
import 'package:weather_app/services/weather_sevice.dart';
import 'package:weather_app/utils/theme_provider.dart';

import '../models/weather_model.dart';
import '../utils/global_theme.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _service = WeatherService(apiKey: "2899bd476324bf6f3ac7a31fab4d5c75");
  String? _cityName;
  final _textController = TextEditingController();
  final Set<String> cidades = {
    'São Paulo',
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
  };
  late Future<Weather?> _weather;

  @override
  void initState() {
    super.initState();
    log("App iniciado");
    _weather = _fetchWeather();
  }

  void _searchWeather({required String searchCity}) {
    log("$searchCity");
  }

   Future<Weather?> _fetchWeather() async {
    String cityName = await _service.getCurrentCity();
    try {
      return await _service.getWeather(cityName);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final IconData icon = themeProvider.themeDataStyle ==
            GlobalTheme(GlobalTextTheme.globalTextTheme).light()
        ? Icons.nightlight_round
        : Icons.sunny;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima", style: TextStyle(
            fontFamily: "Quicksand")),
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
      body: FutureBuilder(
        future: _weather,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
            case ConnectionState.waiting:
            // TODO: Handle this case.
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  children: [
                    Row(
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
                                    _searchWeather(
                                        searchCity: _textController.text);
                                  },
                                  icon: const Icon(Icons.search)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: cidades.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data;
                            return ListItem(
                                cityName: item?.cityName ?? "",
                                temperature: item?.temperature ?? 0,
                                description: item?.description ?? "");
                          }),
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
