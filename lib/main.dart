import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:components_app/src/pages/home_page.dart';
// import 'package:components_app/src/pages/home_tem.dart';
import 'package:components_app/src/pages/alert_page.dart';
// import 'package:components_app/src/pages/avatar_page.dart';
import 'package:components_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      title: 'Components App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // routes: <String, WidgetBuilder>{
      //   '/':(context) => HomePage(),
      //   'alert':(context) => AlertPage(),
      //   'avatar':(context) => AvatarPage(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        print('calling route ${settings.name}');

        return MaterialPageRoute(
            builder: ((BuildContext context) => AlertPage()));
      },
      // home: HomePage()
      // home: HomePageTemp()
    );
  }
}
