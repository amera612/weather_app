import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetInfoCubit extends Cubit<WeatherState> {
  GetInfoCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getWeatherInfo(cityName: cityName);
      emit(LoadedWeatherState(weatherModel!));
    } catch (e) {
      emit(MissingWeatherState(e.toString()));
    }
  }
}
