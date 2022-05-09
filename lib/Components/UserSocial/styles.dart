import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';

TextStyle get textFullName {
  return (TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.baseBlackColor,
  ));
}

TextStyle get textUserName {
  return (TextStyle(
    fontSize: 18,
    color: AppColors.baseBlackColor,
  ));
}

TextStyle get textNumber {
  return (TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get textFollowers {
  return (TextStyle(
    fontSize: 16,
  ));
}

TextStyle get textFollow {
  return (TextStyle(
    fontSize: 16,
  ));
}

TextStyle get textAction {
  return (TextStyle(
    fontSize: 18,
    color: AppColors.baseOrangeColor
  ));
}

