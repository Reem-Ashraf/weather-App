class WeatherModel {
  final dynamic cityName;
  final DateTime date;
  final dynamic image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final dynamic weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        ///in this case i make this to access the first element in the list by using index
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']
    );
  }
}
