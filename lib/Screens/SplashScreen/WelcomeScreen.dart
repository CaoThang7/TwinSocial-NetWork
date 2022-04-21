import 'package:flutter/material.dart';
import 'package:twin_social_network/Components/SplashScreen/body.dart';
import 'package:twin_social_network/Controllers/HomeCtrl.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenSate createState() => WelcomeScreenSate();
}

class WelcomeScreenSate extends State<WelcomeScreen> {
  Widget page = WelcomeScreen();
  var homeController = Get.put(HomeController()); //checkLogin
  @override
  Widget build(BuildContext context) {
    return Body(); // body WelcomeScreen
  }
}
