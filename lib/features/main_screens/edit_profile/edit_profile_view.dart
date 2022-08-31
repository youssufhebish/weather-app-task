import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/cubit/profile_cubit.dart';
import 'package:mini_weather_app/features/main_screens/edit_profile/units/edit_profile_button.dart';
import 'package:mini_weather_app/features/main_screens/edit_profile/units/profile_form.dart';
import 'package:mini_weather_app/features/widgets/custom_app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Profile'.toUpperCase(),),
      body: BlocBuilder<ProfileCubit, BaseState>(
        builder: (context, state) {
          return state is LoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.paddingValue),
                    child: Column(
                      children: const [
                        ProfileForm(),
                        SizedBox(
                          height: Constants.paddingValue * 2.0,
                        ),
                        EditProfileButton(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
