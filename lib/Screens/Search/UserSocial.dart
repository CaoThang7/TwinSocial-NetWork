import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';

import '../../Components/UserSocial/appbars.dart';
import '../../Components/UserSocial/body.dart';

class UserSocial extends StatefulWidget {
  @override
  State<UserSocial> createState() => _UserSocialState();
}

class _UserSocialState extends State<UserSocial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: buildAppBar(context), //app bar Header
      body: Body(),
    );
  }
}
