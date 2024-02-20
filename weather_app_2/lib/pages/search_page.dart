import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String cityName='';
  SearchPage({super.key, this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (data) {
                  cityName = data;
                },
                onSubmitted: (data)  {
                  cityName = data;

                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName);

                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  label: const Text('search'),
                  suffixIcon: GestureDetector(
                      onTap: ()  {
                        BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.search)),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a city',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
