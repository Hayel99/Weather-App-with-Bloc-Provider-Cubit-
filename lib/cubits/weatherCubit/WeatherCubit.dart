import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherState.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  String? cityName;
  WeatherService weatherService;
  WeatherModel? weayherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weayherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSucses());
    } catch (e) {
      emit(WeatherError());
    }
  }
}
