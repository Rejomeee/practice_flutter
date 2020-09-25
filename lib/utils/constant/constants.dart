import 'package:igdb_app/services/shared_preferences.dart';

final dynamic httpOptions = {
  // 'Content-Type': 'application/x-www-form-urlencoded',
  'Accept': 'application/json',
  'Devicetoken': UserPreferences().getData('dt'),
  'Deviceid': UserPreferences().getData('di'),
  'authorization': UserPreferences().getData('token')
};

const urls = {
  // api path
  'get_token': '/rest/api/gettoken',
  // 'login': '/rest/api/main/v/1/ac/login_admin',
  'login': '/rest/api/main/v/1/ac/login_app',
  'logout': '/rest/api/main/v/1/ac/logout_admin',
  'register': '/rest/api/main/v/1/ac/register_admin',
};
