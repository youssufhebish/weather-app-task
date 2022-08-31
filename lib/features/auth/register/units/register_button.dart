import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/cubit/auth_cubit.dart';
import 'package:mini_weather_app/features/widgets/base_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, BaseState>(
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return state is LoadingState? const Center(child: CircularProgressIndicator(),) : BaseButton(
          onTap: (){
            if(cubit.registerForm.currentState!.validate()){
              cubit.signUp();
            }
          },
          buttonText: 'Sign Up',
        );
      },
    );
  }
}
