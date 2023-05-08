import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weatherCubit/WeatherCubit.dart';
import 'package:weatherapp/pages/home_page.dart';

import 'package:weatherapp/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherCubit>(context).weayherModel == null
            ? Colors.blue
            : Provider.of<WeatherCubit>(context).weayherModel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
