import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/cubit/auth_cubit.dart';

import '../../../../core/constants.dart';
import '../../../widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, BaseState>(
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Form(
          key: cubit.loginForm,
          child: Column(
            children: [
              CustomTextField(inputType: InputType.email, controller: cubit.email,),
              const SizedBox(height: Constants.paddingValue,),
              CustomTextField(inputType: InputType.password, controller: cubit.password,),
            ],
          ),
        );
      },
    );
  }
}
