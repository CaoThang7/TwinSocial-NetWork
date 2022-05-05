import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Models/Profile/UserList.dart';

class ImgPicker extends StatefulWidget {
  const ImgPicker({Key? key}) : super(key: key);

  @override
  State<ImgPicker> createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  ProfileController profileController = Get.find();
  final image = "https://cdn-icons-png.flaticon.com/128/2026/2026518.png";
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Obx(
                () => CircleAvatar(
                  backgroundImage: profileController.isProficPicPathSet.value ==
                          true
                      ? FileImage(File(profileController.profilePicPath.value))
                          as ImageProvider
                      : NetworkImage(UserDataList.avatar ?? image),
                  radius: 80,
                ),
              ),
              Positioned(
                bottom: 0,
                child: InkWell(
                  child: Icon(Icons.camera),
                  onTap: () {
                    print("Camera clicked");
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(context));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Chọn một tấm ảnh thật đẹp nào",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.baseOrangeColor,
                ),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.image),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.baseOrangeColor,
                ),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    print(imageFile);
    profileController.setProfileImagePath(imageFile!.path);
    profileController.upLoadImage(); 
    Get.back(); // cloase bottom sheet when pick image
  }
}
