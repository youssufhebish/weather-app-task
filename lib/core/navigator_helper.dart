import 'package:flutter/material.dart';
import 'constants.dart';

class NavigatorHelper{

  /// Navigate to a new route and let the old route
  static Future<dynamic> push(Widget page){
    return Navigator.push(Constants.navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => page));
  }

  /// Navigate to a new route and finishing the old route
  static Future<dynamic> pushReplacement(Widget page) {
    return Navigator.pushAndRemoveUntil(
      Constants.navigatorKey.currentState!.context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  /// GO back method
  static void pop() => Navigator.pop(Constants.navigatorKey.currentState!.context);

  /// Restart the app
  static Future<dynamic> restart() => Navigator.pushNamedAndRemoveUntil(Constants.navigatorKey.currentState!.context, '/', (_) => false);
}
