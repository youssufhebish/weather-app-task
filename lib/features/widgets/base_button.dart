import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.buttonText = '',
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(buttonText, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
