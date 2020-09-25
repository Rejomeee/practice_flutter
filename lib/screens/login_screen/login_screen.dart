import 'package:flutter/material.dart';
import 'package:igdb_app/screens/login_screen/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LoginBody(),
    );
  }
}
