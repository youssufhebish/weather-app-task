import 'package:flutter/material.dart';
import 'package:mini_weather_app/features/auth/register/units/register_button.dart';
import 'package:mini_weather_app/features/auth/register/units/register_form.dart';
import 'package:mini_weather_app/features/auth/register/units/to_login.dart';

import '../../../core/constants.dart';
import '../../widgets/custom_app_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [
              SizedBox(height: Constants.paddingValue * 4.0,),
              RegisterForm(),
              SizedBox(height: Constants.paddingValue,),
              RegisterButton(),
              SizedBox(height: Constants.paddingValue / 2.0,),
              ToLogInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
