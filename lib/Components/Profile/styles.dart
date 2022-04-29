import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';

TextStyle get textFullname {
  return (TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.baseDarkOrangeColor));
}

TextStyle get textEmail {
  return (TextStyle(
    fontSize: 18,
  ));
}

TextStyle get textNumber {
  return (TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get textFollowers {
  return (TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get textFollow {
  return (TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get textHeaderDetail {
  return (TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: AppColors.baseWhiteColor,
  ));
}

TextStyle get textHeaderUpdate {
  return (TextStyle(
    fontSize: 18,
    color: AppColors.baseWhiteColor,
  ));
}
