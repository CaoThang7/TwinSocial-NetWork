import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Post/input_field.dart';
import 'package:twin_social_network/Controllers/PostCtrl.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var data = Get.arguments;
  var postController = Get.put(PostController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                          .copyWith(right: 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(data[1]['avatar'])),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[2]['fullname'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          postController.updatePost(
                              data[0]['id'], data[1]['avatar']);
                        },
                        icon: Icon(
                          Icons.done,
                          color: AppColors.baseOrangeColor,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child:
                            Image.network(data[3]['images'], fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InputContent(
                        hint: data[4]['content'],
                        controller: postController.contentController,
                        visBool: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
