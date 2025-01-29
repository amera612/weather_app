import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_info_cubit/get_info_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: const Color.fromARGB(255, 44, 110, 224),
          title: const Text('Search a city'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onFieldSubmitted: (value) async {
                // to trigger cubit 🫵🏻🫵🏻🫵🏻
                var getInfoCubit = BlocProvider.of<GetInfoCubit>(context);
                getInfoCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black)),
                hintText: 'City Name is',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search_rounded),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      ),
    );
  }
}
