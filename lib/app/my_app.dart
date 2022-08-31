import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/app/material_app.dart';
import 'package:mini_weather_app/cubit/auth_cubit.dart';
import 'package:mini_weather_app/cubit/profile_cubit.dart';
import 'package:mini_weather_app/cubit/weather_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
      BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
      BlocProvider<WeatherCubit>(create: (_) => WeatherCubit()),
    ],
    child: materialApp);
  }
}