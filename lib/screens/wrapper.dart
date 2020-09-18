import 'package:flutter/material.dart';
import 'package:igdb_app/bloc/wrapper_bloc.dart';
import 'package:igdb_app/elements/loader_element.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';
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
    return StreamBuilder<WrapperItem>(
      stream: _wrapperBloc.itemStream,
      initialData: _wrapperBloc.defaultItem,
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
