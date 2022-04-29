import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Profile/styles.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:get/get.dart';

AppBar buildAppBar(BuildContext context) {
  var profileController = Get.put(ProfileController());
  return AppBar(
    centerTitle: true,
    title: Text("Thông tin cá nhân", style: textHeaderDetail),
    backgroundColor: AppColors.baseDarkOrangeColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.baseWhiteColor,
          size: 24,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            profileController.updateUser();
          },
          child: Text(
            'Xong',
            style: textHeaderUpdate,
          ),
        ),
      )
    ],
  );
}
