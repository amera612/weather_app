import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_states.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/search.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }),
                );
              },
              icon: const Icon(Icons.search_rounded),
            ),
          ],
          // backgroundColor: const Color.fromARGB(255, 44, 110, 224),
        ),

        // integrate && lisent to cubit🫵🏻🫵🏻🫵🏻
        body: BlocBuilder<GetInfoCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeather();
            } else if (state is LoadedWeatherState) {
              // ignore: prefer_const_constructors to rebuild in anather search
              return WeatherInfo(
                weather: state.weatherModel,
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(19.0),
                child: Center(
                  child: Text(
                    '🤦🏻‍♀️🤦🏻‍♀️sorry! there is an error try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      //fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
