part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}
class LoadingWeather extends GetWeatherState{}
class GetWeatherSuccessState extends GetWeatherState {
   final WeatherModel weatherModel;
   GetWeatherSuccessState(this.weatherModel);

}
class GetWeatherFailureState extends GetWeatherState {
  final String errorMessage;
  GetWeatherFailureState(this.errorMessage,);
}
