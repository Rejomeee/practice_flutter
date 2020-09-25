import 'package:igdb_app/models/app/app_models/user_details.dart';

class LoginAuthResponse {
  final int error;
  final String message;
  final String token;
  final UserDetails user;

  LoginAuthResponse(
    this.error,
    this.message,
    this.token,
    this.user,
  );

  LoginAuthResponse.fromJson(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"],
        token = json["token"],
        user = json["user"] == null ? null : UserDetails.fromJson(json["user"]);
}
