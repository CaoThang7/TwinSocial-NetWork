import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Models/Register/RegisterModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';

class RegisterController extends GetxController {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  RxString gender = "Nam".obs;
  var selectedDate = DateTime.now().obs;
  var loadingController = Get.put(LoadingController());

  void register() async {
    RegisterModel registerModel = RegisterModel(
      fullname: fullnameController.text,
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      gender: gender.value,
      birthday: selectedDate.value.toString(),
    );
    var response = await NetworkHandler.post(
        registerModelToJson(registerModel), "register");
    var data = json.decode(response);
    await NetworkHandler.storeToken(data["access_token"]);
    if (data["msg"] == "Register Success!") {
      print(data["msg"]);
      await loadingController.loadingButton();
      Get.toNamed("/homeScreen");
    }
  }
}
