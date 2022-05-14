import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/bloc/bloc/post_user_bloc.dart';

import '../../Components/Post/appbars.dart';
import '../../Components/Post/body.dart';

class CreatePost extends StatefulWidget {
  @override
  CreatePostSate createState() => CreatePostSate();
}

class CreatePostSate extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: buildAppBar(context), //app bar Header
      body: BlocProvider(
        create: (context) => PostUserBloc(),
        child: Body(),
      ),
    );
  }
}
