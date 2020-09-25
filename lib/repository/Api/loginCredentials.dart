import 'dart:convert';

import 'package:igdb_app/models/app/app_models/login_auth_response.dart';
import 'package:igdb_app/repository/api_provider.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'package:igdb_app/utils/constant/constants.dart';

final ApiProvider _apiProvider = ApiProvider();
final UserPreferences _prefs = UserPreferences();

Future<LoginAuthResponse> loginCredentials(email, password) async {
  return _apiProvider.makeRequest(
    urlPath: urls['login'],
    method: 'POST',
    jsonData: {'email': email, 'password': password},
  ).then((res) {
    print(res.data);
    LoginAuthResponse response = LoginAuthResponse.fromJson(res.data);
    if (response.error == 0) {
      // _prefs.setData('token', 'Bearer ' + response.token);
      // httpOptions['authorization'] = 'Bearer ' + response.token;
      _prefs.setData('userLogged', json.encode(response.user));
    }

    return response;
  });
}
