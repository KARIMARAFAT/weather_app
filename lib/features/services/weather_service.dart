import 'package:dio/dio.dart';
import 'package:weather_app/features/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'ac5b7484c3734531b0a134850261509';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops , there was an error , try again';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops , there was an error , try again');
    }
  }
}
