import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';

class ProfileController extends GetxController {
  RxString? access_token;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    var response = await NetworkHandler.get("getProfile", scopedToken);
    print("profile ne ba: $response");
    var data = json.decode(response);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String?, dynamic> profile = {
      "id": data["user"]["_id"],
      "fullname": data["user"]["fullname"],
      "username": data["user"]["username"],
      "email": data["user"]["email"],
    };
    prefs.setString("profile", json.encode(profile));
  }
}
