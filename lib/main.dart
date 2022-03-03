import 'package:flutter/material.dart';

import 'package:components_app/src/pages/home_page.dart';
// import 'package:components_app/src/pages/home_tem.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      home: HomePage()
      // home: HomePageTemp()
    );
  }
}