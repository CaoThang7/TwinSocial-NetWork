import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.baseWhiteColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/settings.svg",
          height: 24.0,
          width: 24.0,
        )),
  );
}
