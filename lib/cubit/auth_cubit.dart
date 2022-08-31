import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/colors.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/core/navigator_helper.dart';
import 'package:mini_weather_app/data/repo/auth_repo.dart';
import 'package:mini_weather_app/features/main_screens/home/home_view.dart';

class AuthCubit extends Cubit<BaseState> {
  AuthCubit() : super(const InitState());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  String country = '';

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  GlobalKey<FormState> registerForm = GlobalKey<FormState>();

  /// To Clear The inputs;
  clear(){
    emit(const LoadingState());
    email.clear();
    password.clear();
    userName.clear();
    country = '';
    emit(const DoneState());
  }

  Future signUp() async{
    emit(const LoadingState());
    try {
      await AuthRepo.signUp(email.text, password.text);
      FirebaseFirestore.instance.collection('users').doc(Constants.currentUser!.uid).set(
        {
          'name': userName.text,
          'email': email.text,
          'country': country,
          'location_enabled' : false,
        },
      );
      await Fluttertoast.showToast(msg: 'E-mail has been created successfully', backgroundColor: AppColors.darkGreen,);
      NavigatorHelper.pushReplacement(const HomeView());
      emit(const DoneState());
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: showError[e.code]!, backgroundColor: AppColors.red,);
      debugPrint(e.code);
      emit(ErrorState(msg: ''));
    } catch (e) {
      await Fluttertoast.showToast(msg: e.toString(), backgroundColor: AppColors.red,);
      debugPrint('$e');
      emit(ErrorState(msg: ''));
    }
  }

  Future signIn() async{
    emit(const LoadingState());
    try {
      await AuthRepo.signIn(email.text, password.text);
      await Fluttertoast.showToast(msg: 'Signing In Successfully', backgroundColor: AppColors.darkGreen,);
      NavigatorHelper.pushReplacement(const HomeView());
      emit(const DoneState());
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: showError[e.code]!, backgroundColor: AppColors.red,);
      debugPrint(e.code);
      emit(ErrorState(msg: ''));
    } catch (e) {
      await Fluttertoast.showToast(msg: e.toString(), backgroundColor: AppColors.red,);
      debugPrint('$e');
      emit(ErrorState(msg: ''));
    }
  }
}

Map<String, String> showError = {
  'weak-password' :  'The password provided is too weak.',
  'email-already-in-use' : 'The account already exists for that email.',
  'wrong-password' : 'Wrong password provided for that user.',
  'user-not-found' : 'No user found for that email.',
};