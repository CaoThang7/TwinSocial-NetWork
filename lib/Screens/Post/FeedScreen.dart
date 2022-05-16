import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';

import '../../Components/Feed/appbars.dart';
import '../../Components/Feed/body.dart';


class FeedScreen extends StatefulWidget {
  @override
  FeedScreenSate createState() => FeedScreenSate();
}

class FeedScreenSate extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseGrey10Color,
      appBar: buildAppBar(context), //app bar Header
      body: Body(),
    );
  }
}