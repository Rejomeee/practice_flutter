import 'package:auto_route/auto_route.dart';
import 'package:device_id/device_id.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:igdb_app/repository/Api/getAuthToken.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'dart:io';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();
  UserPreferences _userPreferences = UserPreferences();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        // Called when the app is in the foreground.
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
          /* do a shit */
        },

        // Calles when the app has been close completely.
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');
          _serialiseAndNavigate(message);
        },

        //Called when the app is in the background.
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');
          _serialiseAndNavigate(message);
        },
      );

      if (await _userPreferences.getData('dt') == '' &&
          await _userPreferences.getData('di') == '') {
        // For testing purposes print the Firebase Messaging token
        String token = await _firebaseMessaging.getToken();
        print("FirebaseMessaging token: $token");

        /* Save the device token to the Shared Preference */
        _userPreferences.setData('dt', token);
        var deviceInfo = DeviceInfoPlugin();
        if (Platform.isIOS) {
          IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
          _userPreferences.setData('di', iosDeviceInfo.identifierForVendor);
        } else {
          AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
          _userPreferences.setData('di', androidDeviceInfo.androidId);
        }
        getAuthToken();
      }

      _initialized = true;
    }
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'sign_up') {
        print('hehe');
        ExtendedNavigator.root.push(
          '/sign-up',
        );
        // _navigationService.navigateTo("SignUpScreen");
        // Router.navigatorKey.currentState.popAndPushNamed('/home');
      }
    }
  }
}
