import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';

List<GetPage<dynamic>> get Navigation {
  return [
    GetPage(name: '/homeScreen', page: () => HomeScreen()),
    GetPage(name: '/loginScreen', page: () => LoginScreen()),
    GetPage(name: '/registerScreen', page: () => RegisterScreen()),
  ];
}
