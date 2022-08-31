import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mini_weather_app/core/base_state.dart';
import 'package:mini_weather_app/core/constants.dart';
import 'package:mini_weather_app/core/navigator_helper.dart';
import 'package:mini_weather_app/data/repo/auth_repo.dart';
import 'package:mini_weather_app/data/repo/user_repo.dart';
import 'package:mini_weather_app/features/auth/login/login_view.dart';
import 'package:mini_weather_app/features/main_screens/home/home_view.dart';

class ProfileCubit extends Cubit<BaseState> {
  ProfileCubit() : super(const InitState());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  String country = '';

  GlobalKey<FormState> profileForm = GlobalKey<FormState>();

  Position? position;

  /// To Clear The inputs;
  clear(){
    emit(const LoadingState());
    email.clear();
    password.clear();
    userName.clear();
    country = '';
    emit(const DoneState());
  }

  getUser() async {
    emit(const LoadingState());
    try {
      Constants.userModel = await UserRepo.userData();
      email.text = Constants.userModel!.email!;
      userName.text = Constants.userModel!.name!;
      country = Constants.userModel!.country!;
      emit(const DoneState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(ErrorState(msg: ''));
    }
  }

  signOut() async{
    emit(const LoadingState());
    try{
      await AuthRepo.signOut();
      NavigatorHelper.pushReplacement(const LoginView());
      emit(const DoneState());
    } catch (e){
      debugPrint(e.toString());
      emit(ErrorState(msg: ''));
    }
  }

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    emit(const LoadingState());

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(Constants.userModel!.locationEnabled!){
      Constants.userModel!.locationEnabled = false;
      emit(const DoneState());
      return ;
    }
    if (!serviceEnabled) {
      emit(ErrorState(msg: ''));
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(ErrorState(msg: ''));
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(ErrorState(msg: ''));
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition().then((value) {
      position = value;
      Constants.userModel!.locationEnabled = true;
      Constants.userModel!.lat = value.latitude.toString();
      Constants.userModel!.lng = value.longitude.toString();
      emit(const DoneState());
      return;
    });
  }

  Future updateProfile() async {
    emit(const LoadingState());
    try {
      if(Constants.userModel!.locationEnabled!) {
        await Geolocator.getCurrentPosition().then((value) {
          position = value;
          Constants.userModel!.lat = value.latitude.toString();
          Constants.userModel!.lng = value.longitude.toString();
        });
      }
      FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.currentUser!.uid)
          .set(
        {
          'name': userName.text,
          'email': email.text,
          'country': country,
          'location_enabled': Constants.userModel!.locationEnabled!,
          if (position != null) 'lat': Constants.userModel!.lat.toString(),
          if (position != null) 'lng': Constants.userModel!.lng.toString(),
        },
      );

      final user = FirebaseAuth.instance.currentUser;
      await user!.updateEmail(email.text);
      if (password.text.isNotEmpty) await user.updatePassword(password.text);
      NavigatorHelper.pushReplacement(const HomeView());
      emit(const DoneState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState(msg: ''));
    }
  }
}
