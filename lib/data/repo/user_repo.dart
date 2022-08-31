import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_weather_app/data/model/user_model.dart';

import '../../core/constants.dart';

class UserRepo{
  static Future<UserModel> userData() async {
    final response = await FirebaseFirestore.instance.collection('users').doc(Constants.currentUser?.uid).get();
    debugPrint('USER DATA : ${response.data()}');
    final UserModel request = UserModel.fromJson(response.data() as Map<String, dynamic>);
    return request;
  }
}