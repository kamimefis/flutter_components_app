import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
return <String, WidgetBuilder> {
        '/'     :(context) => HomePage(),
        'alert' :(context) => AlertPage(),
        'avatar':(context) => AvatarPage(),
      };
}

