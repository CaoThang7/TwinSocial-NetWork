import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Feed/post_card.dart';
import 'package:twin_social_network/Controllers/PostCtrl.dart';
import 'package:twin_social_network/Models/Post/PostModel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var postController = Get.put(PostController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FutureBuilder<List<PostModel>>(
        future: postController.getPost(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.baseOrangeColor,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: postController.userLists.length,
              itemBuilder: (context, i) =>
                  PostCard(snap: postController.userLists[i]),
            );
          }
        },
      ),
    );
  }
}
