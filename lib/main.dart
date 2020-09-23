import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:igdb_app/screens/wrapper.dart';
import 'package:igdb_app/services/router/router.gr.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
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
  // final _navigatorKey = Router.navigatorKey;
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorKey,
      projectId: 'flutter_app-ors0eew',
      secret: '5q12tkw8xojogcf68t60ma7xha2en42k',
      theme: WiredashThemeData(
        brightness: Brightness.dark,
      ),
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: false,
        customTranslations: {
          const Locale.fromSubtags(languageCode: 'en'):
              const WiredashCustomTranslation()
        },
      ),
      // translation: WiredashCustomTranslation(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   backgroundColor: Color(0xFF212121),
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        builder: ExtendedNavigator.builder(
          router: Router(),
          builder: (context, extendedNav) => Theme(
            data: ThemeData.light(),
            child: extendedNav,
          ),
        ),
        // home: WrapperScreen(),
        onGenerateRoute: Router(),
        // initialRoute: '/',
        // onGenerateRoute: (settings) => Router.onGenerateRoute(settings),
        // initialRoute: "/wrapper",
      ),
    );
  }
}
