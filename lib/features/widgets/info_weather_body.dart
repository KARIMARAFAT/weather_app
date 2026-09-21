import 'package:flutter/material.dart';
import 'package:weather_app/core/app_text_style.dart';
import 'package:weather_app/features/models/weather_model.dart';
import 'package:weather_app/main.dart';

class InfoWeatherBody extends StatelessWidget {
  const InfoWeatherBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorTheme(weatherModel.currentWeather),
            getColorTheme(weatherModel.currentWeather)[300]!,
            getColorTheme(weatherModel.currentWeather)[200]!,
            getColorTheme(weatherModel.currentWeather)[100]!,
            getColorTheme(weatherModel.currentWeather)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Text(weatherModel.cityName, style: AppTextStyle.primaryText),

            Text(
              'Updated at ${weatherModel.lastUpdate.hour}:${weatherModel.lastUpdate.minute}',
              style: AppTextStyle.subTitle,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image != null &&
                          weatherModel.image!.startsWith('//')
                      ? 'https:${weatherModel.image}'
                      : weatherModel.image ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.cloud_off, size: 50);
                  },
                ),

                Text(
                  weatherModel.avgTemp.round().toString(),
                  style: AppTextStyle.primaryText,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'maxtemp = ${weatherModel.maxTemp.round()}',
                      style: AppTextStyle.subTitle,
                    ),
                    Text(
                      'mintemp = ${weatherModel.minTemp.round()}',
                      style: AppTextStyle.subTitle,
                    ),
                  ],
                ),
              ],
            ),
            Text(weatherModel.currentWeather, style: AppTextStyle.primaryText),
          ],
        ),
      ),
    );
  }
}
