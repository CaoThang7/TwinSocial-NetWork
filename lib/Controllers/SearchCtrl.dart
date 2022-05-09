import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Models/User/UserModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class SearchController extends GetxController {
  TextEditingController search = TextEditingController();
  var profileController = Get.put(ProfileController());
  List<UserSearch> ulist = [];
  List<UserSearch> userLists = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    serachUser();
    loadData();
  }

  void loadData () async {
      serachUser().then((userFromServer) {
        ulist = userFromServer;
        userLists = ulist;
    });
  }
  
  Future<List<UserSearch>> serachUser() async {
    var scopedToken = await NetworkHandler.getToken("access_token");
    profileController.access_token?.value = scopedToken!;
    final response = await http.get(
        Uri.parse('http://10.0.3.2:5000/api/search?username=${search.text}'),
        headers: {
          "Content-type": "application/json",
          "authorization": "Bearer $scopedToken"
        });
    print(response.body);
    return compute(decodeJson, response.body);
  }
}

List<UserSearch> decodeJson(String responseBody) {
  final myJson = json.decode(responseBody);
  return myJson['users']
      .map<UserSearch>((json) => UserSearch.fromJson(json))
      .toList();
}
