import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';

import '../../services/weather_app_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weatherModel;
  fetchWeatherModel({required cityName}) async {
    emit(LoadingWeather());
    try {
       weatherModel =
          await WeatherAppServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccessState(weatherModel!));
    } on DioException catch (e) {
      emit(GetWeatherFailureState(
        e.toString()
      ));
      throw (e.toString());
    }
  }
}
