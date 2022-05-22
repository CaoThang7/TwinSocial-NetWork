import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/PostCtrl.dart';
import 'package:twin_social_network/Models/Profile/MenuProfile.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:twin_social_network/Utils/DropdownMenu.dart';
import 'package:favorite_button/favorite_button.dart';
import '../../Models/Post/PostModel.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  var postController = Get.put(PostController());
  var listLike;
  String? getIdUser;
  var isLike = false;
  @override
  void initState() {
    super.initState();
    checkIfLike();
  }

  Future<void> checkIfLike() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    listLike = widget.snap.likes;
    for (var i = 0; i < listLike.length; i++) {
      print(listLike[i]);
      if (listLike[i] == getIdUser) {
        setState(() {
          isLike = true;
        });
      }
    }
  }

  Future<void> likePost() async {
    RxString? access_token;
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    PostModel postModel = PostModel(
      userId: widget.snap.userId['_id'],
    );
    var response = await NetworkHandler.patch(
        postModelToJson(postModel), "post/${widget.snap.id}/like", scopedToken);
    var data = json.decode(response);
    if (data['msg'] == "The post has been liked") {
      setState(() {
        isLike = true;
      });
    }
  }

  Future<void> dislike() async {
    RxString? access_token;
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    PostModel postModel = PostModel(
      userId: widget.snap.userId['_id'],
    );
    var response = await NetworkHandler.patch(postModelToJson(postModel),
        "post/${widget.snap.id}/unlike", scopedToken);
    var data = json.decode(response);
    if (data['msg'] == "The post has been disliked") {
      setState(() {
        isLike = false;
      });
    }
  }

  // onSelected item Dropdown
  void onSelected(BuildContext context, Object? item) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    String getIdUser = mapData["id"];
    switch (item) {
      case DropdownMenuPost.edit:
        print(widget.snap.id);
        if (getIdUser != widget.snap.userId["_id"]) {
          Get.snackbar(
            "Lỗi rồi",
            "Bạn không thể cập nhật bài viết của người khác",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: AppColors.baseDarkOrangeColor,
            colorText: AppColors.baseWhiteColor,
          );
        } else {
          Get.toNamed("updatePostScreen", arguments: [
            {"id": widget.snap.id},
            {"avatar": widget.snap.userId["avatar"]},
            {"fullname": widget.snap.userId["fullname"]},
            {"images": widget.snap.images[0]},
            {"content": widget.snap.content},
          ]);
        }
        break;
      case DropdownMenuPost.remove:
        print("xoa");
        break;
      case DropdownMenuPost.copylink:
        print("copy link");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // HEADER SECTION OF THE POST
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14)
                  .copyWith(right: 0),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 16,
                      backgroundImage:
                          NetworkImage(widget.snap.userId["avatar"])),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.snap.userId["fullname"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) {
                        return DropdownMenuPost.itemsFirst
                            .map((MenuProfile item) {
                          return PopupMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                Icon(item.icon, color: Colors.black),
                                const SizedBox(width: 20),
                                Text(
                                  item.text,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        }).toList();
                      })
                ],
              ),
            ),
            // IMAGE SECTION
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child:
                        Image.network(widget.snap.images[0], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            // LIKE COMMENT SECTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5)
                  .copyWith(right: 0),
              child: Row(
                children: [
                  isLike
                      ? IconButton(
                          onPressed: () {
                            dislike();
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            likePost();
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                          ),
                        ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            // DESCRIPTION AND NUMBER OF COMMENTS
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 8,
                    ),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: AppColors.baseOrangeColor),
                          children: [
                            TextSpan(
                                text: widget.snap.userId["fullname"],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " "),
                            TextSpan(
                              text: widget.snap.content,
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
