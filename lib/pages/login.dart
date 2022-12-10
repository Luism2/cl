import 'package:flutter/material.dart';
import 'package:register/pages/calendar_page.dart';
import 'package:register/main.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 241, 129, 55),
        radius: 120.0,
        child: Image.asset('assets/utt_logo_ver_6.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: true,
      initialValue: '',
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(CalendarPage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(255, 68, 155, 76),
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = MaterialButton(
      child: Text(
        'olvidaste tu contraseña?',
        style: TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 160, 68),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
