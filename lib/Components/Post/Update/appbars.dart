import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Controllers/PostCtrl.dart';
import 'package:twin_social_network/Navigation/Navigation.dart';

AppBar buildAppBar(BuildContext context) {
  var postController = Get.put(PostController());
  return AppBar(
    centerTitle: true,
    title: Text(
      "Chỉnh sửa bài viết",
      style: TextStyle(
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 26.0),
    ),
    backgroundColor: AppColors.baseWhiteColor,
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
  );
}
