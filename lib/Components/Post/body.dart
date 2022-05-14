import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twin_social_network/Components/Post/input_field.dart';
import 'package:twin_social_network/Controllers/PostCtrl.dart';
import 'package:twin_social_network/bloc/bloc/post_user_bloc.dart';

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
    final postBloc = BlocProvider.of<PostUserBloc>(context);
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final List<XFile>? images = await _picker.pickMultiImage();
                  if (images != null) {
                    postBloc.add(onSelectMultipleImageEvent(images));
                  }
                  postController.uploadFunction(images!);
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColors.baseSeaShellColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 0.1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: AppColors.baseOrangeColor,
                          spreadRadius: 0.1,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        )
                      ]),
                  child: BlocBuilder<PostUserBloc, PostUserState>(
                      builder: (context, state) => state.images != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.images!.length,
                              itemBuilder: (_, i) => Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: FileImage(
                                              File(state.images![i].path)),
                                          fit: BoxFit.cover,
                                        )),
                                  ))
                          : Icon(
                              Icons.photo_camera,
                              size: 80,
                              color: Colors.grey,
                            )),
                ),
              ),
              InputContent(
                hint: "Nhập thông tin",
                controller: postController.contentController,
                visBool: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
