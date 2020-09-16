import 'package:flutter/material.dart';
import 'package:igdb_app/bloc/login_bloc.dart';
import 'package:igdb_app/elements/rounded_buttons.dart';
import 'package:igdb_app/elements/rounded_input_field.dart';
import 'package:igdb_app/elements/rounded_password_field.dart';
import 'package:igdb_app/screens/login_screen/components/background.dart';
import 'package:igdb_app/screens/main_screen/main_screen.dart';
import 'package:igdb_app/widgets/wiredash.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    String _email, _password;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                StreamBuilder(
                  stream: loginBloc.email,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return RoundedInputField(
                      onSaved: (emailValue) =>
                          loginBloc.emailChanged.add(emailValue),
                      onChanged: (emailValue) =>
                          loginBloc.emailChanged.add(emailValue),
                      hintText: 'Your Email',
                      errorText: snapshot.error,
                      hasError: snapshot.hasError,
                    );
                  },
                ),
                // RoundedInputField(
                //   onSaved: (emailValue) => emailValue,
                //   onChanged: (emailValue) => emailValue,
                //   hintText: 'Your Email',
                //   // errorText: snapshot.error,
                // ),
                StreamBuilder(
                  stream: loginBloc.password,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return StreamBuilder(
                      stream: loginBloc.passwordToggle,
                      initialData: true,
                      builder:
                          (BuildContext context, AsyncSnapshot toggleSnapshot) {
                        return RoundedPasswordField(
                          hintText: 'Password',
                          onSaved: (passValue) =>
                              loginBloc.passwordChanged.add(passValue),
                          onChanged: (passValue) =>
                              loginBloc.passwordChanged.add(passValue),
                          passVisible: toggleSnapshot.data,
                          onTap: () async {
                            loginBloc.toggleObscure(toggleSnapshot.data);
                          },
                          errorText: snapshot.error,
                          hasError: snapshot.hasError,
                        );
                      },
                    );
                  },
                ),
                // RoundedPasswordField(
                //   hintText: 'Password',
                //   onSaved: (passValue) => passValue,
                //   onChanged: (passValue) => passValue,
                //   // passVisible: toggleSnapshot.data,
                //   // onTap: () async {
                //   //   loginBloc.toggleButton(toggleSnapshot.data);
                //   // },
                //   // errorText: snapshot.error,
                // ),
                StreamBuilder(
                  stream: loginBloc.submitCheck,
                  builder:
                      (BuildContext context, AsyncSnapshot submitSnapshot) {
                    return StreamBuilder(
                      stream: loginBloc.isLoading,
                      initialData: false,
                      builder: (BuildContext context,
                          AsyncSnapshot isLoadingSnapshot) {
                        return RoudedButton(
                          text: isLoadingSnapshot.data ? 'loading...' : 'LOGIN',
                          press: () {
                            loginBloc
                              ..submit().then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MainScreen();
                                    },
                                  ),
                                ),
                              );
                          },
                          // if email and password is true OR loading is false
                          disableButton:
                              (!submitSnapshot.hasData || isLoadingSnapshot.data
                                  ? true
                                  : false),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
