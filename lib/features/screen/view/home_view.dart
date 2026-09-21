import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_text_style.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/features/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/features/screen/view/search_view.dart';
import 'package:weather_app/features/widgets/info_weather_body.dart';
import 'package:weather_app/features/widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchView()));
            },
            icon: Icon(Icons.search, size: 30),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherDataLoadedState) {
            return InfoWeatherBody(weatherModel: state.weatherModel);
          } else {
            return Center(
              child: Text(
                'oops please try again',
                style: AppTextStyle.primaryText,
              ),
            );
          }
        },
      ),
    );
  }
}
