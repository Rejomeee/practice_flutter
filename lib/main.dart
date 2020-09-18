import 'package:flutter/material.dart';
import 'package:igdb_app/screens/wrapper.dart';
import 'package:igdb_app/services/router/router.gr.dart';
import 'package:igdb_app/services/shared_preferences.dart';
import 'package:igdb_app/widgets/wiredash.dart';
import 'package:wiredash/wiredash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorKey,
      projectId: 'flutter_app-ors0eew',
      secret: '5q12tkw8xojogcf68t60ma7xha2en42k',
      theme: WiredashThemeData(
        brightness: Brightness.light,
      ),
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: false,
        customTranslations: {
          const Locale.fromSubtags(): const WiredashCustomTranslation()
        },
      ),
      // translation: WiredashCustomTranslation(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          backgroundColor: Color(0xFF212121),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: WrapperScreen(),
        onGenerateRoute: (settings) => Router.onGenerateRoute(settings),
        initialRoute: "/wrapper",
      ),
    );
  }
}
