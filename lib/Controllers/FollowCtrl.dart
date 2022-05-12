import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Models/User/UserModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';

class FollowController extends GetxController {
  var isFollow = false.obs;
  var profileController = Get.put(ProfileController());
  var data = Get.arguments;
  var listfollowing;
  var listfollowers;
  String? getIdUser;
  @override
  void onInit() {
    super.onInit();
    checkIfFollowing();
    getFollowing();
    getFollowers();
  }

  Future<void> getFollowing() async {
    listfollowing = data[5]['following'] ?? "";
  }

  Future<void> getFollowers() async {
    listfollowers = data[4]['followers'] ?? "";
  }

  Future<void> checkIfFollowing() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    listfollowing = data[5]['following'] ?? "";
    // find id in list following using for
    for (var i = 0; i < listfollowing.length; i++) {
      print(listfollowing[i]["_id"]);
      if (listfollowing[i]["_id"] == getIdUser) {
        isFollow.value = true;
      }
    }
  }

  Future<void> handleFollow() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    var scopedToken = await NetworkHandler.getToken("access_token");
    profileController.access_token?.value = scopedToken!;
    userIdFollow userIdProfile = userIdFollow(
      userId: data[0]['id'] ?? "",
    );
    var response = await NetworkHandler.patchFollow(
        userIdFollowToJson(userIdProfile),
        "user/$getIdUser/follow",
        scopedToken);
    print("follow: $response");
    var follow = json.decode(response);
    if (follow["msg"] == "user has been followed") {
      isFollow.value = true;
    }
    if (follow["msg"] == "you cant follow yourself") {
      Get.snackbar(
        "Lỗi rồi",
        follow["msg"],
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        backgroundColor: AppColors.baseDarkOrangeColor,
        colorText: AppColors.baseWhiteColor,
      );
    }
  }

  Future<void> handleUnFollow() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    var scopedToken = await NetworkHandler.getToken("access_token");
    profileController.access_token?.value = scopedToken!;
    userIdFollow userIdProfile = userIdFollow(
      userId: data[0]['id'] ?? "",
    );
    var response = await NetworkHandler.patchFollow(
        userIdFollowToJson(userIdProfile),
        "user/$getIdUser/unfollow",
        scopedToken);
    print("unfollow: $response");
    var unfollow = json.decode(response);
    if (unfollow["msg"] == "user has been unfollowed") {
      isFollow.value = false;
    }
    if (unfollow["msg"] == "you cant unfollow yourself") {
      Get.snackbar(
        "Lỗi rồi",
        unfollow["msg"],
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
        backgroundColor: AppColors.baseDarkOrangeColor,
        colorText: AppColors.baseWhiteColor,
      );
    }
  }
}
