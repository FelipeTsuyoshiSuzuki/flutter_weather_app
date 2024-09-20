class Weather {
  final String cityName;
  final double temperature;
  final String mainConditions;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainConditions,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      Weather(
          cityName: json['name'],
          temperature: json['main']['temp'].toDouble(),
          mainConditions: json['weather'][0]['main'],
          description:json['weather'][0]['description']
      );
}