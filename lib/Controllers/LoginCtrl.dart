import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Models/Login/LoginModel.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:twin_social_network/Utils/Utils.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loadingController = Get.put(LoadingController());

  void login() async {
    LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    var response =
        await NetworkHandler.post(loginModelToJson(loginModel), "login");
    var data = json.decode(response);
    await NetworkHandler.storeToken(data["access_token"]);
    print(data["msg"]);
    if (data["msg"] == "Login Success!") {
      await loadingController.loadingButton();
      Get.toNamed("/homeScreen");
    }
  }
}
