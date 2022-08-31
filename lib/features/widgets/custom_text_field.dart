import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/colors.dart';
import 'package:mini_weather_app/core/validators.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.inputType,
    this.withoutValidator = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final InputType inputType;
  final bool withoutValidator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObSecured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: inputSelector[widget.inputType]['input_type'],
      obscureText: inputSelector[widget.inputType]['secured'] ?? isObSecured,
      validator: widget.withoutValidator? Validators.letNull : inputSelector[widget.inputType]['validator'],
      decoration: InputDecoration(
        prefixIcon: Icon(
          inputSelector[widget.inputType]['prefix'],
          color: AppColors.textColor,
        ),
        hintText: inputSelector[widget.inputType]['hint'],
        suffixIcon: inputSelector[widget.inputType]['visibility']
            ? null
            : IconButton(
               splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    isObSecured = !isObSecured;
                  });
                },
                icon: Icon(
                  isObSecured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.textColor,
                )),
      ),
    );
  }
}

enum InputType{
  email,
  password,
  name;
}

Map<InputType, dynamic> inputSelector = {
  InputType.email : {
    'hint' : 'E-Mail',
    'prefix' : Icons.email_outlined,
    'input_type' : TextInputType.emailAddress,
    'validator' : Validators.emailValidator,
    'secured' : false,
    'visibility' : true,
  },
  InputType.name : {
    'hint' : 'User Name',
    'prefix' : Icons.person_outline,
    'input_type' : TextInputType.text,
    'validator' : Validators.cantBeEmpty,
    'secured' : false,
    'visibility' : true,
  },
  InputType.password : {
    'hint' : 'Password',
    'prefix' : Icons.lock_outline,
    'input_type' : TextInputType.visiblePassword,
    'validator' : Validators.passwordValidator,
    'secured' : null,
    'visibility' : false,
  },
};