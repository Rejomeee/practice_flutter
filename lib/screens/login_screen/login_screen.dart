import 'package:flutter/material.dart';
import 'package:igdb_app/screens/login_screen/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build login');
    return Scaffold(
      body: LoginBody(),
    );
  }
}
