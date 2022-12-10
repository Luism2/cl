import 'dart:js_util';

import 'package:register/pages/calendar_page.dart';
import 'package:register/res/colors.dart';
import 'package:flutter/material.dart';

class principal_app extends StatefulWidget {
  const principal_app({super.key});

  @override
  _principal_app createState() => _principal_app();
}

class _principal_app extends State<principal_app> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: green),
        primaryColor: orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: orange),
        iconTheme: const IconThemeData(color: green),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              color: green,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: green,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            shadowColor: Colors.transparent,
            elevation: 0,
            foregroundColor: green,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
      home: const CalendarPage(),
    );
  }
}
