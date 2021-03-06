import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Models/Login/LoginModel.dart';
import 'package:twin_social_network/Models/Profile/UserList.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:twin_social_network/Utils/Utils.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loadingController = Get.put(LoadingController());

  // Login
  void login() async {
    LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    var response =
        await NetworkHandler.post(loginModelToJson(loginModel), "login");
    var data = json.decode(response);
    await NetworkHandler.storeToken(data["access_token"]);
    if (data["msg"] == "Login Success!") {
      await loadingController.loadingButton();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String?, dynamic> idUser = {
        "id": data["user"]["_id"],
      };
      prefs.setString("idUser", json.encode(idUser));
      Get.toNamed("/homeScreen");
      emailController.clear(); // after login value email clear
      passwordController.clear(); // after login value password clear
    }
  }

  // Logout
  void logout() async {
    LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    var response =
        await NetworkHandler.post(loginModelToJson(loginModel), "logout");
    var data = json.decode(response);
    // if Logged out success: show dialog confirm or cancel
    if (data["msg"] == "Logged out!") {
      Get.defaultDialog(
        title: "B???n c?? ch???c ch???n ????ng xu???t?",
        titleStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        middleText: "TwinSocial xin ch??o v?? h???n g???p l???i!",
        textCancel: "Hu???",
        cancelTextColor: Colors.black,
        textConfirm: "?????ng ??",
        confirmTextColor: Colors.white,
        buttonColor: AppColors.baseDarkOrangeColor,
        onCancel: () {},
        onConfirm: () async {
          await NetworkHandler.removeToken(); // remove token in storage
          Get.toNamed("/loginScreen");
        },
      );
    }
  }
}
