import 'package:flutter/material.dart';
import 'package:register/pages/login.dart';
import 'package:register/pages/calendar_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    CalendarPage.tag: (context) => CalendarPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
