import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Models/Profile/ProfileModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import '../Models/Profile/UserList.dart';
import 'package:path/path.dart';
import 'package:twin_social_network/Utils/Utils.dart';

class ProfileController extends GetxController {
  RxString? access_token;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  RxString gender = "Nam".obs;
  var selectedDate = DateTime.now().obs;
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;
  String? profileImageBase64;
  String? urlDownload;
  String? getIdUser;
  var loadingController = Get.put(LoadingController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> setProfileImagePath(String path) async {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
    final bytes = File(profilePicPath.value);
    profileImageBase64 = basename(bytes.path);
    print("hinh ne: $profileImageBase64");
  }

  Future<void> getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    var response = await NetworkHandler.get("user/$getIdUser", scopedToken);
    print("profile ne ba: $response");
    var data = json.decode(response);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String?, dynamic> profile = {
      "id": data["user"]["_id"],
      "fullname": data["user"]["fullname"],
      "username": data["user"]["username"],
      "email": data["user"]["email"],
      "gender": data["user"]["gender"],
      "avatar": data["user"]["avatar"],
    };
    prefs.setString("profile", json.encode(profile));
  }

  Future<void> updateUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    final networkHandler = NetworkHandler();
    ProfileUserModel profileModel = ProfileUserModel(
      id: getIdUser,
      fullname: fullnameController.text,
      username: usernameController.text,
      avatar: urlDownload,
      gender: gender.value,
      birthday: selectedDate.value.toString(),
    );
    var response = await NetworkHandler.patch(
        ProfileModelToJson(profileModel), "user/update", scopedToken);
    var data = json.decode(response);
    if (data["msg"] == "Update Success!") {
      print("Update thanh cong!");
      await loadingController.loadingButton();
    } else {
      Get.snackbar(
        "Lỗi rồi",
        data["msg"],
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        backgroundColor: AppColors.baseDarkOrangeColor,
        colorText: AppColors.baseWhiteColor,
      );
    }
    return;
  }

  Future<void> upLoadImage() async {
    final path = 'files/${profileImageBase64}';
    final bytes = File(profilePicPath.value);
    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(bytes);
    final snapshot = await uploadTask
        .whenComplete(() => {}); // upload file image to firebase
    urlDownload =
        await snapshot.ref.getDownloadURL(); //get link image in firebase
    print("Download Link: $urlDownload");
  }
}
