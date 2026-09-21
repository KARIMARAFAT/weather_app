import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/screen/view/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider >> provide cubit
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getColorTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.currentWeather,
                  ),
                ),
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    case 'Haze':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Dust haze':
    case 'Blowing dust':
    case 'Dust storm':
    case 'Sandstorm':
    case 'Severe sandstorm':
    case 'Dust':
    case 'Saharan dust':
      return Colors.brown;

    case 'Smoke':
    case 'Smoky haze':
    case 'Smog':
    case 'Severe smog':
      return Colors.deepOrange;

    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lightBlue;

    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;

    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.blue;

    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy sleet possible':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;

    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.indigo;

    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;

    case 'Thundery outbreaks possible':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
