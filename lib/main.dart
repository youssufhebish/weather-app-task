import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_weather_app/app/my_app.dart';
import 'package:mini_weather_app/core/dio_helper.dart';

import 'core/constants.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if(FirebaseAuth.instance.currentUser != null){
    Constants.currentUser = FirebaseAuth.instance.currentUser;
  }
  if (!kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  DioHelper.init();

  runApp(
    const MyApp(),
  );
}

