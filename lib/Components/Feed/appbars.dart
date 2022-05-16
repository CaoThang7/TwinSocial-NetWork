import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      "Twin Social",
      style: TextStyle(
          color: AppColors.baseOrangeColor,
          fontWeight: FontWeight.bold,
          fontSize: 26.0),
    ),
    backgroundColor: AppColors.baseGrey10Color,
    elevation: 0,
    automaticallyImplyLeading: false, // hide leading icon back
  );
}
