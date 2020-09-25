import 'dart:convert';

import 'package:igdb_app/models/app/app_models/user_details.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class GetUserDetailsBloc {
  final UserPreferences _prefs = UserPreferences();
  final BehaviorSubject<UserDetails> _userDetails =
      BehaviorSubject<UserDetails>();

  getUserDetails() async {
    dynamic userDetailsPref = json.decode(await _prefs.getData('userLogged'));
    print('userDetailsPref');
    print(userDetailsPref);
    UserDetails userDetails = UserDetails.fromJson(userDetailsPref);
    _userDetails.sink.add(userDetails);
  }

  dispose() {
    _userDetails.close();
  }

  BehaviorSubject<UserDetails> get userDetails => _userDetails;
}

final getUserDetailsBloc = GetUserDetailsBloc();
