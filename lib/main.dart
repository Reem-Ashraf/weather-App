import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: getThemColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition)),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemColor(String? condition) {
  condition = condition?.toLowerCase();
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'thundery outbreaks possible':
      return Colors.cyan;
    case 'blowing snow':
    case 'blizzard':
    case 'heavy freezing drizzle':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'moderate or heavy freezing rain':
    case 'moderate or heavy sleet':
    case 'moderate or heavy snow':
    case 'ice pellets':
    case 'torrential rain shower':
    case 'moderate or heavy rain shower':
    case 'moderate or heavy sleet showers':
    case 'moderate or heavy snow showers':
    case 'moderate or heavy showers of ice pellets':
    case 'moderate or heavy rain with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'patchy light snow':
    case 'light snow':
    case 'light rain shower':
    case 'light sleet showers':
    case 'light snow showers':
    case 'light showers of ice pellets':
    case 'patchy light rain with thunder':
    case 'patchy light snow with thunder':
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'light sleet':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
