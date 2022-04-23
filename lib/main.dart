import 'package:flutter/material.dart';
import 'package:login_firebase/screens/home_screen.dart';
import 'package:login_firebase/screens/login_screen.dart';
import 'package:login_firebase/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Firebase',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
