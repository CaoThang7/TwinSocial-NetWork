import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Register/appbars.dart';
import 'package:twin_social_network/Components/Register/body.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenSate createState() => RegisterScreenSate();
}

class RegisterScreenSate extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseGrey10Color,
      appBar: buildAppBar(context), //Header trang Register
      body: Body(), //Body trang Register
    );
  }
}




