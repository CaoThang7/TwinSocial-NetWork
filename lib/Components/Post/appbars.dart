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
      "Bài viết mới",
      style: TextStyle(
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 26.0),
    ),
    backgroundColor: AppColors.baseWhiteColor,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            postController.createPost();
          },
          child: Text(
            'Đăng',
            style: TextStyle(color: AppColors.baseOrangeColor, fontSize: 18.0),
          ),
        ),
      )
    ],
  );
}
