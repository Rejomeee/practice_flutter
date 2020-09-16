import 'package:flutter/material.dart';
import 'package:igdb_app/elements/rounded_buttons.dart';
import 'package:igdb_app/elements/rounded_input_field.dart';
import 'package:igdb_app/elements/rounded_password_field.dart';
import 'package:igdb_app/screens/main_screen/components/background.dart';
import 'package:igdb_app/widgets/wiredash.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _wiredashConsole = WiredashConsole();

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //get the height and width of the screen.
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text('Home'),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onDoubleTap: () => _wiredashConsole.build(context),
                  child: Text(
                    'Wiredash',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
