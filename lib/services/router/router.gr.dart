// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:igdb_app/screens/wrapper.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';

class Router {
  static const wrapper = '/wrapper';
  static const login = '/login';
  static const home = '/home';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.wrapper:
        return MaterialPageRoute(
          builder: (_) => WrapperScreen(),
          settings: settings,
        );
      case Router.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case Router.home:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
