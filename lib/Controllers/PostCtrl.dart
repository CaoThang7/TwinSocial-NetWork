import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Models/Post/PostModel.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';

class PostController extends GetxController {
  RxString? access_token;
  String? getIdUser;
  var urlDownload;
  List<String> _arrImage = [];
  TextEditingController contentController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void uploadFunction(List<XFile> _images) {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = takePhoto(_images[i]);
      _arrImage.add(imageUrl.toString());
    }
  }

  Future<void> takePhoto(XFile _image) async {
    final path = 'files/${_image.name}';
    final bytes = File(_image.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(bytes);
    final snapshot = await uploadTask
        .whenComplete(() => {}); // upload file image to firebase
    urlDownload =
        await snapshot.ref.getDownloadURL(); //get link image in firebase
    print("Download Link: $urlDownload");
  }

  Future<void> createPost() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mapData = json.decode(sharedPreferences.getString("idUser") ?? "");
    getIdUser = mapData["id"];
    var scopedToken = await NetworkHandler.getToken("access_token");
    access_token?.value = scopedToken!;
    PostModel postModel = PostModel(
      userId: getIdUser,
      content: contentController.text,
      images: [urlDownload],
    );
    var response = await NetworkHandler.createPostUser(
        postModelToJson(postModel), "posts", scopedToken);
    var data = json.decode(response);
    print("??? $data");
  }
}
