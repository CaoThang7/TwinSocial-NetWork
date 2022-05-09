import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Search/SearchDelegate.dart';
import 'package:twin_social_network/Controllers/SearchCtrl.dart';
import 'package:twin_social_network/Models/User/UserModel.dart';
import 'package:get/get.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: AppColors.baseWhiteColor,
    elevation: 1,
    titleSpacing: 0,
    leading: IconButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: MySearch(),
          );
        },
        icon: Icon(
          Icons.search,
          color: AppColors.baseBlackColor,
        )),
    title: Text(
      "Tìm kiếm",
      style: TextStyle(
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0),
    ),
  );
}
