import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;
    Future<void> loadingButton() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
  }
}
