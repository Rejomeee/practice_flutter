import 'dart:async';

import 'package:igdb_app/services/shared_preferences.dart';

enum WrapperItem { HOME, LOGIN }

class WrapperBloc {
  final StreamController<WrapperItem> _switchController =
      StreamController<WrapperItem>.broadcast();

  WrapperItem defaultItem = WrapperItem.LOGIN;

  Stream<WrapperItem> get itemStream => _switchController.stream;

  void showHome() {
    print('showHome');
    _switchController.sink.add(WrapperItem.HOME);
  }

  void showLogin() {
    print('showLogin');
    _switchController.sink.add(WrapperItem.LOGIN);
  }

  void userIsLogged() async {
    UserPreferences _prefs = UserPreferences();
    String isLogged = await _prefs.getData('userLogged');
    if (isLogged != '')
      showHome();
    else
      showLogin();
    // int counter = (prefs.getBool('counter') ?? 0) + 1;
    // print('Pressed $counter times.');
    // await prefs.setInt('counter', counter);
  }

  close() {
    _switchController?.close();
  }
}

final wrapperBloc = WrapperBloc();
