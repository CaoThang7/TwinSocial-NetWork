import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Profile/appbars.dart';
import 'package:twin_social_network/Components/Profile/body.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';

class ProfileScreen extends StatefulWidget {
 
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileController = Get.put(ProfileController()); //get profile wiht getx
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: buildAppBar(context), //app bar Header
      body: Body(), 
    );
  }
}