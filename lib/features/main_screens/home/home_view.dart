import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/cubit/weather_cubit.dart';
import 'package:mini_weather_app/features/main_screens/home/units/weather_widget.dart';
import 'package:mini_weather_app/features/widgets/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    context.read<WeatherCubit>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, BaseState>(
      builder: (context, state) {
        var cubit = context.read<WeatherCubit>();
        return Scaffold(
          appBar: customAppBar(
            title: 'Weather app'.toUpperCase(),
            isHome: true,
          ),
          body: state is LoadingState ? const Center(
            child: CircularProgressIndicator(),
                )
              : WeatherWidget(
                  title: 'Weather in ${Constants.userModel!.locationEnabled!? 'your location ' : Constants.userModel!.country} ' 'is',
                  image: 'https:${cubit.weatherModel.current!.condition!.icon!}',
                  status: cubit.weatherModel.current!.condition!.text!,
                  temp: '${cubit.weatherModel.current!.tempC!} °C',
                ),
        );
      },
    );
  }
}
