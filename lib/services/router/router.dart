import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/components/home_view_game_details.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';
import 'package:igdb_app/screens/wrapper.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: WrapperScreen, initial: true, name: "wrapper"),
    MaterialRoute(page: LoginScreen, name: "login"),
    MaterialRoute(page: MainScreen, name: "home"),
    MaterialRoute(page: HomeViewGameDetailsScreen, name: "view_game"),
  ],
)
class $Router {}
