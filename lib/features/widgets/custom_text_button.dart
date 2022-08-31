import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/custom_text.dart';

import '../../core/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.buttonText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: CustomText.main(
        buttonText,
        color: AppColors.primaryColor,
        fontSize: 12.0,
      ),
    );
  }
}
