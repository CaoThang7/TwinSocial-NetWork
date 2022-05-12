import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Components/UserSocial/styles.dart';
import 'package:twin_social_network/Components/UserSocial/user_social_profile.dart';
import 'package:twin_social_network/Controllers/FollowCtrl.dart';
import 'package:twin_social_network/Models/User/UserModel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var data = Get.arguments;
  var followController = Get.put(FollowController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          profileUserSocial(), // get profile user social
          Center(
            child: Text("abc"),
          ),
        ],
      ),
    );
  }
}
