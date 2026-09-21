class WeatherModel {
  final String cityName;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String currentWeather;
  final DateTime lastUpdate;
  WeatherModel({
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.currentWeather,
    required this.lastUpdate,
    required this.cityName,
    this.image,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      currentWeather:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
      lastUpdate: DateTime.parse(json['current']['last_updated']),
      cityName: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
