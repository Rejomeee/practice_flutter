// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/game/game.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../screens/main_screen/components/home_view_game_details.dart';
import '../../screens/main_screen/main_screen.dart';
import '../../screens/wrapper.dart';

class Routes {
  static const String wrapper = '/';
  static const String login = '/login-screen';
  static const String home = '/main-screen';
  static const String view_game = '/home-view-game-details-screen';
  static const all = <String>{
    wrapper,
    login,
    home,
    view_game,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.wrapper, page: WrapperScreen),
    RouteDef(Routes.login, page: LoginScreen),
    RouteDef(Routes.home, page: MainScreen),
    RouteDef(Routes.view_game, page: HomeViewGameDetailsScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WrapperScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WrapperScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    MainScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainScreen(),
        settings: data,
      );
    },
    HomeViewGameDetailsScreen: (data) {
      final args =
          data.getArgs<HomeViewGameDetailsScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeViewGameDetailsScreen(
          key: args.key,
          game: args.game,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeViewGameDetailsScreen arguments holder class
class HomeViewGameDetailsScreenArguments {
  final Key key;
  final GameModel game;
  HomeViewGameDetailsScreenArguments({this.key, @required this.game});
}
