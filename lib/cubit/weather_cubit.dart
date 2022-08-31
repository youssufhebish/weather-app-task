import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/cubit/profile_cubit.dart';
import 'package:mini_weather_app/data/model/weather_model.dart';
import 'package:mini_weather_app/data/repo/weather_repo.dart';

class WeatherCubit extends Cubit<BaseState> {
  WeatherCubit() : super(const InitState());

  WeatherModel weatherModel = WeatherModel();
  String q = '';

  getWeather() async{
    emit(const LoadingState());
    try{
      await Constants.navigatorKey.currentState!.context.read<ProfileCubit>().getUser();
      q = Constants.userModel!.locationEnabled!
          ? '${Constants.userModel!.lat!},${Constants.userModel!.lng!}'
          : Constants.userModel!.country!;
      weatherModel = await WeatherRepo.weatherData(q);
      emit(const DoneState());
    } catch (e, s){
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(ErrorState(msg: ''));
    }
  }
}
