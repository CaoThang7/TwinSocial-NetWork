import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/UserSocial/styles.dart';
import 'package:twin_social_network/Controllers/FollowCtrl.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';

AppBar buildAppBar(BuildContext context) {
  var data = Get.arguments;
  var followController = Get.put(FollowController());
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
      Obx(() => followController.isFollow.value
          ? TextButton(
              onPressed: () {
                followController.handleUnFollow();
              },
              child: Text(
                "Huỷ",
                style: textAction,
              ),
            )
          : TextButton(
              onPressed: () {
                followController.handleFollow();
              },
              child: Text(
                "Theo dõi",
                style: textAction,
              ),
            ))
    ],
  );
}
