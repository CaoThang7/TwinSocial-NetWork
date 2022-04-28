import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Controllers/LoginCtrl.dart';
import 'package:twin_social_network/Models/Profile/MenuProfile.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';
import 'package:twin_social_network/Utils/DropdownMenu.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.baseWhiteColor,
      elevation: 0,
      leading: PopupMenuButton(
          icon: SvgPicture.asset(
            "assets/icons/settings.svg",
            height: 24.0,
            width: 24.0,
          ),
          color: Colors.white,
          elevation: 20,
          enabled: true,
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) {
            return DropdownMenuProfile.itemsFirst.map((MenuProfile item) {
              return PopupMenuItem(
                value: item,
                child: Row(
                  children: [
                    Icon(item.icon, color: Colors.black),
                    const SizedBox(width: 20),
                    Text(
                      item.text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }).toList();
          }));
}

// onSelected item Dropdown
void onSelected(BuildContext context, Object? item) {
  var loginController = Get.put(LoginController());
  switch (item) {
    case DropdownMenuProfile.itemSettings:
      print("Settings");
      break;
    case DropdownMenuProfile.itemInfomation:
      print("Infomation");
      break;
    case DropdownMenuProfile.itemSignOut:
      loginController.logout(); // logout with getx
      break;
  }
}
