import 'package:flutter/material.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';
import 'package:twin_social_network/Screens/SplashScreen/WelcomeScreen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(MyApp());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      getPages: Navigation,
    );
  }
}
