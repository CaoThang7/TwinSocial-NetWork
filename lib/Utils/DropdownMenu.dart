import 'package:flutter/material.dart';
import 'package:twin_social_network/Models/Profile/MenuProfile.dart';

class DropdownMenuProfile {
  static const List<MenuProfile> itemsFirst =[
    itemSettings,
    itemInfomation,
    itemSignOut
  ];
  static const itemSettings = MenuProfile(
    text: 'Cài đặt',
    icon: Icons.settings,
  );
    static const itemInfomation = MenuProfile(
    text: 'Thông tin cá nhân',
    icon: Icons.account_circle_outlined,
  );
    static const itemSignOut = MenuProfile(
    text: 'Đăng xuất',
    icon: Icons.logout,
  );
}