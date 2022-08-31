import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/model/user_model.dart';

class Constants{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String label = 'Weather';
  static const double paddingValue = 24.0;
  static User? currentUser;
  static UserModel? userModel;
  static const String apiUrl = 'http://api.weatherapi.com/v1/current.json';
  static const String apiKey = '9e323a0675524c448aa135102222708';
}