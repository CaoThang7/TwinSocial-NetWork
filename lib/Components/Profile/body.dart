import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Components/Profile/styles.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Models/Profile/UserList.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final image = "https://cdn-icons-png.flaticon.com/128/2026/2026518.png";
  var profileController = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("profile") ?? "");
    setState(() {
      UserDataList.fullname = mapData["fullname"];
      UserDataList.email = mapData["email"];
      UserDataList.username = mapData["username"];
      UserDataList.gender = mapData["gender"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UserDataList.fullname,
                    style: textFullname,
                  ),
                  Text(
                    UserDataList.email,
                    style: textEmail,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: AppColors.baseDarkOrangeColor,
                radius: 54.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 50.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: textNumber,
                  ),
                  Text(
                    "Nguời theo dõi",
                    style: textFollowers,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: textNumber,
                  ),
                  Text(
                    "Đang theo dõi",
                    style: textFollow,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
