import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/features/main_screens/home/home_view.dart';

import '../core/colors.dart';
import '../features/auth/login/login_view.dart';

MaterialApp materialApp = MaterialApp(
  navigatorKey: Constants.navigatorKey,
  title: 'Weather',
  theme: ThemeData(
    primarySwatch: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.textColor,
        height: 0.0,
        fontSize: 14.0,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    ),
  ),
  home: Constants.currentUser == null? const LoginView() : const HomeView(),
);