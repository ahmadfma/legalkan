import 'package:flutter/material.dart';

class NavigationCustom {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<T?> navigateTo<T>(String routeName) {
    return navigatorKey.currentState!.pushNamed<T>(routeName);
  }

  Future<T?> navigateReplace<T>(String routeName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil<T>(routeName, (Route<dynamic> route) => false);
  }
}
