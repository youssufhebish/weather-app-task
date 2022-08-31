import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/custom_text.dart';
import 'package:mini_weather_app/core/navigator_helper.dart';
import 'package:mini_weather_app/cubit/auth_cubit.dart';
import 'package:mini_weather_app/features/auth/login/login_view.dart';
import 'package:mini_weather_app/features/widgets/custom_text_button.dart';

class ToLogInWidget extends StatelessWidget {
  const ToLogInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText.single('Have account? ', fontSize: 12.0,),
        CustomTextButton(
          buttonText: 'Sign In',
          onTap: () {
            context.read<AuthCubit>().clear();
            NavigatorHelper.pushReplacement(const LoginView());
          },
        ),
      ],
    );
  }
}
