import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_app_services.dart';

class SearchView extends StatelessWidget {
  SearchView({
    Key? key,
  }) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: (dynamic value) async {
              var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.fetchWeatherModel(cityName: value!);
              Navigator.pop(context);
            },
            controller: searchController,
            decoration: InputDecoration(
                labelText: "Search",
                suffixIcon: const Icon(Icons.search_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
      ),
    );
  }
}


