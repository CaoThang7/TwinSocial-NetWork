import 'package:flutter/material.dart';
import 'package:twin_social_network/Models/Profile/MenuProfile.dart';

class DropdownMenuProfile {
  static const List<MenuProfile> itemsFirst = [
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

class DropdownMenuPost {
  static const List<MenuProfile> itemsFirst = [
    edit,
    remove,
    copylink,
  ];
  static const edit = MenuProfile(
    text: 'Chỉnh sửa',
    icon: Icons.edit,
  );
  static const remove = MenuProfile(
    text: 'Xoá',
    icon: Icons.delete,
  );
  static const copylink = MenuProfile(
    text: 'copy link',
    icon: Icons.share,
  );
}
