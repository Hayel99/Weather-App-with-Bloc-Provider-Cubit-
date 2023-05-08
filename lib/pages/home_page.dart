import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weatherCubit/WeatherCubit.dart';
import 'package:weatherapp/cubits/weatherCubit/weatherState.dart';
import 'package:weatherapp/pages/search_page.dart';

import '../models/weather_model.dart';
import '../widgets/initialBody.dart';
import '../widgets/sucsesBody.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSucses) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weayherModel;
            return sucsesWidget(weatherData: weatherData);
          } else if (state is WeatherError) {
            return Center(
              child: Text('There someThing went wrong try agin please '),
            );
          } else {
            return initalBody();
          }
        },
      ),
    );
  }
}
