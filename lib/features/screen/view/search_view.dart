import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search City')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 200),
        child: TextField(
          onSubmitted: (value) async {
            // ignore: use_build_context_synchronously
            var getweatherData = BlocProvider.of<GetWeatherCubit>(context);
            getweatherData.getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 10),
            hintText: 'Enter your city',
            label: Text('Search'),
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
