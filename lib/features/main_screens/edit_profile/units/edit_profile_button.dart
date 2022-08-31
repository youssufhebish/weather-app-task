import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/colors.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/cubit/profile_cubit.dart';
import 'package:mini_weather_app/features/main_screens/home/home_view.dart';
import 'package:mini_weather_app/features/widgets/base_button.dart';

import '../../../../core/navigator_helper.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, BaseState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Column(
          children: [
            BaseButton(
                    buttonText: Constants.userModel!.locationEnabled!? 'Disable Location' : 'Enable Location',
                    buttonColor: Constants.userModel!.locationEnabled!? AppColors.red : AppColors.primaryColor,
                    onTap: () async => await cubit.determinePosition(),
                  ),
            const SizedBox(height: Constants.paddingValue / 2.0,),
            BaseButton(
                    buttonText: 'UPDATE',
                    onTap: () async => await cubit.updateProfile(),
                  ),
            const SizedBox(height: Constants.paddingValue / 2.0,),
            BaseButton(
              onTap: () => cubit.signOut(),
              buttonText: 'SIGN OUT',
              buttonColor: AppColors.red,
            ),
            const SizedBox(height: Constants.paddingValue / 2.0,),
            BaseButton(
              onTap: () => NavigatorHelper.pushReplacement(const HomeView()),
              buttonText: 'CANCEL',
              buttonColor: AppColors.red,
            ),
          ],
        );
      },
    );
  }
}
