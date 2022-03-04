import 'package:flutter/material.dart';

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
      title: 'Components App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // routes: <String, WidgetBuilder>{
      //   '/':(context) => HomePage(),
      //   'alert':(context) => AlertPage(),
      //   'avatar':(context) => AvatarPage(),
      // },
      onGenerateRoute: (RouteSettings settings){

        print('calling route ${settings.name}');

        return MaterialPageRoute(
          builder: ((BuildContext context) => AlertPage())
          );
      },
      // home: HomePage()
      // home: HomePageTemp()
    );
  }
}