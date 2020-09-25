import 'package:auto_route/auto_route.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        // Called when the app is in the foreground.
        onMessage: (Map<String, dynamic> message) async {
          showNotification(message['notification']['title'],
              message['notification']['body']);
          print("onMessage: $message");
          if (message['data']['notify_bell'] != null) {
            /* do a shit */
          }
        },

        // Calles when the app has been close completely.
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');
          _serialiseAndNavigate(message: message);
        },

        //Called when the app is in the background.
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');
          _serialiseAndNavigate(message: message);
        },
      );

      if (await _userPreferences.getData('dt') == '' &&
          await _userPreferences.getData('di') == '') {
        // For testing purposes print the Firebase Messaging token
        String token = await _firebaseMessaging.getToken();
        print("FirebaseMessaging token: $token");

        /* Save the device token to the Shared Preference */
        await _userPreferences.setData('dt', token);
        var deviceInfo = DeviceInfoPlugin();
        if (Platform.isIOS) {
          IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
          await _userPreferences.setData(
              'di', iosDeviceInfo.identifierForVendor);
        } else {
          AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
          await _userPreferences.setData('di', androidDeviceInfo.androidId);
        }
      }

      _initialized = true;
    }
  }

  void showNotification(String title, String body) async {
    await _demoNotification(title, body);
  }

  Future<void> _demoNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.Max,
        playSound: true,
        // sound: AndroidNotificationSound,
        showProgress: true,
        priority: Priority.High,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'test');
  }

  void _serialiseAndNavigate(
      {Map<String, dynamic> message, bool onMessage = false}) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null && !onMessage) {
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
