import 'package:register/pages/calendar_page.dart';
import 'package:register/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Example app theme.
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
