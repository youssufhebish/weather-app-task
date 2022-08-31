import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_weather_app/core/constants.dart';

class AuthRepo{

  /// Sign Up Repo
  static Future<UserCredential> signUp(String email, String password) async{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Constants.currentUser = credential.user;
    debugPrint('USER DATA : ${Constants.currentUser}');
    return credential;
  }

  /// Sign In Repo
  static Future<UserCredential> signIn(String email, String password) async{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    Constants.currentUser = credential.user;
    debugPrint('USER DATA : ${Constants.currentUser}');
    return credential;
  }

  /// Sign Out Repo
  static Future signOut() async{
    await FirebaseAuth.instance.signOut();
    Constants.currentUser = null;
    Constants.userModel = null;
  }

}