import 'package:flutter/material.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';
import 'package:twin_social_network/Screens/SplashScreen/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}
