import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import '../../Components/Profile/Detail/appbars.dart';
import '../../Components/Profile/Detail/body.dart';

class DetailProfile extends StatefulWidget {
  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  var profileController = Get.put(ProfileController());
  var loadingController = Get.put(LoadingController()); //get profile wiht getx
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: buildAppBar(context), //app bar Header
      body: Body(),
    );
  }
}
