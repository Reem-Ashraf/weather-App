import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //WeatherModel weather=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather App')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchView()));
              },
              icon: const Icon(Icons.search_sharp))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is LoadingWeather) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is GetWeatherSuccessState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Center(child: Text("Oops There Were an Error "));
          }
        },
      ),
    );
  }
}
