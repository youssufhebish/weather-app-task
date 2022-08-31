import 'package:flutter/material.dart';
import '../../../../core/custom_text.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget(
      {required this.title, required this.image, required this.status, required this.temp, Key? key,})
      : super(key: key);

  final String title;
  final String image;
  final String status;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.main(title),
        Image.network(image),
        CustomText.main(status, fontSize: 16.0,),
        const SizedBox(height: 5.0, width: double.infinity,),
        CustomText.main(temp)
      ],
    );
  }
}
