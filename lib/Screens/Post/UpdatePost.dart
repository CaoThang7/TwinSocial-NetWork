import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';

import '../../Components/Post/Update/appbars.dart';
import '../../Components/Post/Update/body.dart';

class UpdatePost extends StatefulWidget {
  @override
  UpdatePostSate createState() => UpdatePostSate();
}

class UpdatePostSate extends State<UpdatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: buildAppBar(context), //app bar Header
      body: Body(),
    );
  }
}
