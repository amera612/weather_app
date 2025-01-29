import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_states.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetInfoCubit(),
      child:
          //use builder widget to use context anather the above 🐤🐤🐤
          Builder(builder: (context) {
        return BlocBuilder<GetInfoCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherColor(
                  BlocProvider.of<GetInfoCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? dayCondition) {
  if (dayCondition == null) {
    return Colors.blue;
  }
  switch (dayCondition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'patchy light rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'patchy light snow':
    case 'blizzard':
    case 'ice pellets':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
    case 'thundery outbreaks possible':
      return Colors.blueGrey;

    default:
      return Colors.grey;
  }
}
