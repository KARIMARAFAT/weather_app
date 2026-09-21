import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/models/weather_model.dart';
import 'package:weather_app/features/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  Future<void> getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(Dio())
          .getWeather(cityName: cityName);
      emit(WeatherDataLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
