import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_2/models/weather_model.dart';
import 'package:weather_app_2/services/weather_service.dart';

part 'weatehr_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit( this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String cityName='';
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());

    try {
      weatherModel=await weatherService.getWeather(cityName: cityName);
      this.cityName=cityName;
      emit(WeatherSuccessState());
    } catch (e) {
      log(e.toString());
      emit(WeatherFailuerState()); 
    }
  }
}
