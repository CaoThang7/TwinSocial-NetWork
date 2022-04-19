import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';
class Navigation {
   static Future? homeScreen =  Get.to(HomeScreen());
   static Future? registerScreen =  Get.to(RegisterScreen());
   static Future? loginScreen =  Get.to(LoginScreen());
}
