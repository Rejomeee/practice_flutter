import 'package:flutter/material.dart';
import 'package:igdb_app/elements/rounded_buttons.dart';
import 'package:igdb_app/elements/rounded_input_field.dart';
import 'package:igdb_app/elements/rounded_password_field.dart';
import 'package:igdb_app/screens/main_screen/components/home_bg.dart';
import 'package:igdb_app/widgets/home_popular_list.dart';
import 'package:igdb_app/widgets/home_slider.dart';
import 'package:igdb_app/widgets/wiredash.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return HomeBg(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeSlider(),
          ],
        ),
      ),
    );
  }
}
