import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Profile/Detail/image_picker.dart';
import 'package:twin_social_network/Components/Register/input_field.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Models/Gender/GenderModel.dart';
import 'package:intl/intl.dart';
import 'package:twin_social_network/Models/Profile/UserList.dart';
import 'package:twin_social_network/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final globalkey = GlobalKey<FormState>();
  var profileController = Get.put(ProfileController());
  var loadingController = Get.put(LoadingController());
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    profileController.fullnameController.addListener(() => setState(() {}));
    profileController.usernameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          color: AppColors.baseGrey10Color,
          child: Form(
            key: globalkey,
            child: Obx(() => loadingController.isLoading.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Vui lòng chờ ...',
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ImgPicker(), // Image Profile with Image Picker
                      // Input Họ và tên
                      InputRegister(
                        hint: UserDataList.fullname,
                        controller: profileController.fullnameController,
                        // valid_input: validFullName,
                        suffixIcon:
                            profileController.fullnameController.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/delete.svg",
                                      height: 10,
                                      width: 10,
                                    ),
                                    onPressed: () => profileController
                                        .fullnameController
                                        .clear(),
                                  ),
                        visBool: false,
                      ),
                      // Input Tên tài khoản
                      InputRegister(
                        hint: UserDataList.username,
                        controller: profileController.usernameController,
                        valid_input: validUserName,
                        suffixIcon:
                            profileController.usernameController.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/delete.svg",
                                      height: 10,
                                      width: 10,
                                    ),
                                    onPressed: () => profileController
                                        .usernameController
                                        .clear(),
                                  ),
                        visBool: false,
                      ),
                      Row(
                        children: [
                          // Input giới tính
                          Obx(
                            () => Expanded(
                              child: InputRegister(
                                hint: profileController.gender.value,
                                suffixIcon: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    elevation: 0,
                                    iconSize: 32,
                                    // lấy dữ liệu từ GenderModel và map ra
                                    items: GenderModel()
                                        .genderList
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toString(),
                                        child: Text(
                                          value.toString(),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profileController.gender.value = value!;
                                      });
                                    },
                                  ),
                                ),
                                visBool: false,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Input ngày sinh
                          Obx(
                            () => Expanded(
                              child: InputRegister(
                                hint: DateFormat.yMd().format(
                                    profileController.selectedDate.value),
                                suffixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                      "assets/icons/calendar.svg"),
                                  onPressed: () {
                                    getDateFromUser(context);
                                  },
                                ),
                                visBool: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
