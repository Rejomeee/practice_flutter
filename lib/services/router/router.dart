import 'package:auto_route/auto_route_annotations.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';
import 'package:igdb_app/screens/wrapper.dart';

@autoRouter
class $Router {
  WrapperScreen wrapper;
  LoginScreen login;
  MainScreen home;
}
