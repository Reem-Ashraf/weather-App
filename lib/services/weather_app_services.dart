import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherAppServices {
  final String baseUrl = 'http://api.weatherapi.com';
  final String path = '/v1';
  final String apiKey = '89b1261bca8e4f35801163313230911';
  final Dio dio;
  WeatherAppServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required dynamic cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl$path/forecast.json?key=$apiKey&q=$cityName&days=1');
      print(response.data.toString());

      ///i want to return my data from my json
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      print(weatherModel.cityName);
      return weatherModel;}
        on DioException catch(e){
      final String errorMessage=e.response?.data['error']['message'] ?? 'There were err please try later';
      throw Exception(errorMessage);
        }catch(e){
       throw('Ops there were an error, try later');
     }
  }
}
