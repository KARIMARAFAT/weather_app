import 'package:flutter/material.dart';
import 'package:weather_app/core/app_text_style.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Weather Data', style: AppTextStyle.primaryText),
          Text(
            "there is no weather information right now. Please search again later.",
            textAlign: TextAlign.center,
            style: AppTextStyle.subTitle,
          ),
        ],
      ),
    );
  }
}
