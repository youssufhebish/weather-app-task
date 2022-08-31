import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_weather_app/core/base_state.dart';

import '../../../../core/constants.dart';
import '../../../../cubit/profile_cubit.dart';
import '../../../widgets/custom_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, BaseState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Form(
          key: cubit.profileForm,
          child: Column(
            children: [
              CustomTextField(inputType: InputType.name, controller: cubit.userName,),
              const SizedBox(height: Constants.paddingValue,),
              CustomTextField(inputType: InputType.email, controller: cubit.email,),
              const SizedBox(height: Constants.paddingValue,),
              CustomTextField(inputType: InputType.password, controller: cubit.password, withoutValidator: true,),
              const SizedBox(height: Constants.paddingValue,),
              /// I Know that's a bad solution
              /// - for a small task I had forced to deal with it that way
              /// - in normal case I will customize the package to make it suitable to our case
              /// - any way it's running .. .. ..
              /// - BTW it's a bad package with limited options
              SizedBox(
                height: 45.0,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SelectState(
                      onCountryChanged: (value) {
                        value = value.split(' ').last;
                        cubit.country = value;
                        debugPrint('Selected Country is ${cubit.country}');
                      },
                      onStateChanged:(value) {

                      },
                      onCityChanged:(value) {

                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
