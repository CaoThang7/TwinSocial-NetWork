import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/UserSocial/styles.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';

AppBar buildAppBar(BuildContext context) {
  var data = Get.arguments;
  return AppBar(
    centerTitle: true,
    title: Text(
      data[1]['fullname'] ?? "",
      style: textFullName,
    ),
    backgroundColor: AppColors.baseSeaShellColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          "assets/icons/delete.svg",
          height: 16.0,
          width: 16.0,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Theo dõi',
            style: textAction,
          ),
        ),
      )
    ],
  );
}
