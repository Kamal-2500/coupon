import 'package:flutter/material.dart';
import 'package:login/pages/homepage.dart';
import 'package:login/pages/login.dart';
import 'package:login/pages/register.dart';
import 'package:login/pages/register1.dart';
import 'package:login/pages/register2.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Login Screen',

      debugShowCheckedModeBanner: false,

      //theme
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),

       // home: Scaffold(
       //      appBar: AppBar(title: Text('coupON')),
       //      body: Center(
       //          child: LoginPage()
       //      )
       //  )
      home: HomePage(),
      //home: SignupPage1(),

    );
  }
}

