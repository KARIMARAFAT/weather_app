import 'package:flutter/material.dart';
import 'package:weather_app/core/app_text_style.dart';
import 'package:weather_app/features/models/weather_model.dart';

class InfoWeatherBody extends StatelessWidget {
  const InfoWeatherBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              weatherModel.image != null && weatherModel.image!.startsWith('//')
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Text(
                    "maxtemp = ${weatherModel.maxTemp.round()}",
                    style: AppTextStyle.subTitle,
                  ),
                  Text(
                    "maxtemp = ${weatherModel.minTemp.round()}",
                    style: AppTextStyle.subTitle,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text(
            weatherModel.currentWeather,
            style: AppTextStyle.primaryText,
          ),
        ),
      ],
    );
  }
}
