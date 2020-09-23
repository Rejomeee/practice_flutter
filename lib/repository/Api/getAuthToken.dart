import 'package:igdb_app/models/app/get_token_response.dart';
import 'package:igdb_app/repository/api_provider.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'package:igdb_app/utils/constant/constants.dart';

final ApiProvider _apiProvider = ApiProvider();
final UserPreferences _prefs = UserPreferences();

void getAuthToken() async {
  return _apiProvider
      .makeRequest(urlPath: urls['get_token'], method: 'GET')
      .then((res) {
    GetTokenResponse response = GetTokenResponse.fromJson(res.data);
    if (response.error == 0) {
      _prefs.setData('token', 'Bearer ' + response.data.token);
      httpOptions['authorization'] = 'Bearer ' + response.data.token;
    }
  });

  // print('res');
  // print(res.data);
  // GetTokenResponse response = res.data;
  // print('res');
  // print(response);
  // print(response.error);
  // if (response.error == 0) {
  //   print('httpOptions start');
  //   print(httpOptions);
  //   _prefs.setData('token', 'Bearer ' + response.data.token);
  //   httpOptions['authorization'] = 'Bearer ' + response.data.token;
  //   print('httpOptions end');
  //   print(httpOptions);
  // }
}
