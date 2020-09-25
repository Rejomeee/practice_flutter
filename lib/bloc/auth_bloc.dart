import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:igdb_app/models/app/app_models/login_auth_response.dart';
import 'package:igdb_app/repository/Api/loginCredentials.dart';
import 'package:igdb_app/utils/validators/validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:igdb_app/services/shared_preferences.dart';

class AuthBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordToggleController = BehaviorSubject<bool>();
  final _isLoadingController = BehaviorSubject<bool>();

  BehaviorSubject<bool> get passwordToggle => _passwordToggleController;
  BehaviorSubject<bool> get isLoading => _isLoadingController;
  StreamSink<String> get emailChanged => _emailController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passValidator);

  Stream<bool> get submitCheck =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  Future<LoginAuthResponse> submit() async {
    _isLoadingController.sink.add(true);
    LoginAuthResponse loginAuthResponse = await loginCredentials(
        _emailController.value, _passwordController.value);
    _isLoadingController.sink.add(false);
    return loginAuthResponse;
  }

  void logOut() async {
    UserPreferences _prefs = UserPreferences();
    await _prefs.removeData('userLogged');
    print('logged out');
    ExtendedNavigator.root.pushAndRemoveUntil('/', (route) => false);
  }

  void toggleObscure(bool toggle) =>
      _passwordToggleController.sink.add(!toggle);

  close() {
    _emailController.close();
    _passwordController.close();
    _passwordToggleController.close();
    _isLoadingController.close();
  }
}

final loginBloc = AuthBloc();
