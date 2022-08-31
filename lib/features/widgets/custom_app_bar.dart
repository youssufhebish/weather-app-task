import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/colors.dart';
import 'package:mini_weather_app/core/navigator_helper.dart';
import 'package:mini_weather_app/features/main_screens/edit_profile/edit_profile_view.dart';

AppBar customAppBar({
  String title = '',
  bool isHome = false,
}) =>
    AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textColor,
        ),
      ),
      actions: [
        Visibility(
          visible: isHome,
          child: IconButton(
            onPressed: () =>
                NavigatorHelper.pushReplacement(const EditProfileView()),
            icon: const Icon(Icons.settings, color: AppColors.primaryColor,),
          ),
        ),
      ],
    );
