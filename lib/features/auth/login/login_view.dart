import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/features/auth/login/units/login_button.dart';
import 'package:mini_weather_app/features/auth/login/units/login_form.dart';
import 'package:mini_weather_app/features/auth/login/units/to_register.dart';
import 'package:mini_weather_app/features/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'SIGN IN'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [
              SizedBox(height: Constants.paddingValue * 4.0,),
              LoginForm(),
              SizedBox(height: Constants.paddingValue,),
              LoginButton(),
              SizedBox(height: Constants.paddingValue / 2.0,),
              ToRegisterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
