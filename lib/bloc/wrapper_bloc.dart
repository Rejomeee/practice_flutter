import 'dart:async';

import 'package:igdb_app/repository/Api/getAuthToken.dart';
import 'package:igdb_app/services/push_notification.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
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
    // if (await _prefs.getData('dt') == '' && await _prefs.getData('di') == '')
    // getAuthToken()
    await PushNotificationsManager().init();

    if (isLogged != '')
      showHome();
    else
      showLogin();
  }

  close() {
    _switchController?.close();
  }
}

final wrapperBloc = WrapperBloc();
