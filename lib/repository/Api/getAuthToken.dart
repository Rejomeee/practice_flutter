import 'package:flutter/material.dart';
import 'package:igdb_app/models/app/get_token_response.dart';
import 'package:igdb_app/repository/api_provider.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'package:igdb_app/utils/constant/constants.dart';

final ApiProvider _apiProvider = ApiProvider();
final UserPreferences _prefs = UserPreferences();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

void getAuthToken() async {
  print('hhehh');
  try {
    print('hhehh try in');
    return _apiProvider
        .makeRequest(urlPath: urls['get_token'], method: 'GET')
        .then((res) {
      print('hhehh in');
      print(res);
      GetTokenResponse response = GetTokenResponse.fromJson(res.data);
      if (response.error == 0) {
        _prefs.setData('token', 'Bearer ' + response.data.token);
        httpOptions['authorization'] = 'Bearer ' + response.data.token;
        print(httpOptions);
      } else {
        print('response.error: ${response.message}');
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('${response.message}')));
      }
    });
  } catch (e) {
    print('Error get request: $e');
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text('Something went wrong.')));
  }
}
