import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Models/Profile/ProfileModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import '../Models/Profile/UserList.dart';

class ProfileController extends GetxController {
  RxString? access_token;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  RxString gender = "Nam".obs;
  var selectedDate = DateTime.now().obs;
  var loadingController = Get.put(LoadingController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
    updateUser();
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
      "gender": data["user"]["gender"],
    };
    prefs.setString("profile", json.encode(profile));
  }

  Future<void> updateUser() async {
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    ProfileModel profileModel = ProfileModel(
      id: UserDataList.id,
      fullname: fullnameController.text,
      username: usernameController.text,
      gender: gender.value,
      birthday: selectedDate.value.toString(),
    );
    var response = await NetworkHandler.patch(
        ProfileModelToJson(profileModel), "user/update", scopedToken);
    var data = json.decode(response);
    if (data["msg"] == "Update Success!") {
      print("Update thanh cong!");
      await loadingController.loadingButton();
    }
  }
}
