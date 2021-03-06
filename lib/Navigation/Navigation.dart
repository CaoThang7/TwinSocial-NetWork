import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Post/UpdatePost.dart';
import 'package:twin_social_network/Screens/Profile/DetailProfile.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';
import 'package:twin_social_network/Screens/Search/UserSocial.dart';

List<GetPage<dynamic>> get Navigation {
  return [
    GetPage(name: '/homeScreen', page: () => HomeScreen()),
    GetPage(name: '/loginScreen', page: () => LoginScreen()),
    GetPage(name: '/registerScreen', page: () => RegisterScreen()),
    GetPage(name: '/detailProfileScreen', page: () => DetailProfile()),
    GetPage(name: '/userSocialScreen', page: () => UserSocial()),
    GetPage(name: '/updatePostScreen', page: () => UpdatePost()),
  ];
}
