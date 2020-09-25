import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:igdb_app/bloc/wrapper_bloc.dart';
import 'package:igdb_app/elements/loader_element.dart';
import 'package:igdb_app/repository/Api/getAuthToken.dart';
import 'package:igdb_app/repository/dio_connectivity_request_retrier.dart';
import 'package:igdb_app/repository/retry_interceptor.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WrapperScreen extends StatefulWidget {
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  WrapperBloc _wrapperBloc;

  @override
  void initState() {
    super.initState();
    _wrapperBloc = WrapperBloc();
    _wrapperBloc..userIsLogged();
  }

  @override
  Widget build(BuildContext context) {
    print('build wrapper');
    return StreamBuilder<WrapperItem>(
      stream: _wrapperBloc.itemStream,
      builder: (BuildContext context, AsyncSnapshot<WrapperItem> snapshot) {
        switch (snapshot.data) {
          case WrapperItem.HOME:
            return MainScreen();

          case WrapperItem.LOGIN:
            return LoginScreen();
        }
        return Scaffold(
          body: buildScreenLoadingWidget(1),
        );
      },
    );
  }
}
