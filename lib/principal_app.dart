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
            const FloatingActionButtonThemeData(backgroundColor: violet),
        primaryColor: violet,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: violet),
        iconTheme: const IconThemeData(color: violet),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              color: violet,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: violet,
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
            foregroundColor: violet,
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
