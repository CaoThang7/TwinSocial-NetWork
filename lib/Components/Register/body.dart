import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Register/input_field.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Controllers/RegisterCtrl.dart';
import 'package:twin_social_network/Models/Gender/GenderModel.dart';
import 'package:intl/intl.dart';
import 'package:twin_social_network/Utils/Utils.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool visPassword = true;
  bool visConfirmPassword = true;
  var loadingController = Get.put(LoadingController());
  final globalkey = GlobalKey<FormState>();

  var registerController = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    registerController.fullnameController.addListener(() => setState(() {}));
    registerController.usernameController.addListener(() => setState(() {}));
    registerController.emailController.addListener(() => setState(() {}));
  }

  void onClickRegister() async {
    globalkey.currentState!.validate(); //check validation from login
    registerController.register();
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
            child: Column(
              children: [
                // Input Họ và tên
                InputRegister(
                  hint: "Họ và tên",
                  controller: registerController.fullnameController,
                  valid_input: validFullName,
                  suffixIcon: registerController.fullnameController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () =>
                              registerController.fullnameController.clear(),
                        ),
                  visBool: false,
                ),
                // Input Tên tài khoản
                InputRegister(
                  hint: "Tên tài khoản",
                  controller: registerController.usernameController,
                  valid_input: validUserName,
                  suffixIcon: registerController.usernameController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () =>
                              registerController.usernameController.clear(),
                        ),
                  visBool: false,
                ),
                // Input Email
                InputRegister(
                  hint: "email",
                  controller: registerController.emailController,
                  valid_input: validEmail,
                  suffixIcon: registerController.emailController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () =>
                              registerController.emailController.clear(),
                        ),
                  visBool: false,
                ),
                // Input Password
                InputRegister(
                  hint: "Mật khẩu",
                  controller: registerController.passwordController,
                  valid_input: validPassword,
                  suffixIcon: IconButton(
                    icon: visPassword
                        ? SvgPicture.asset("assets/icons/eyesoff.svg")
                        : SvgPicture.asset("assets/icons/eyeson.svg"),
                    onPressed: () {
                      setState(() {
                        visPassword = !visPassword;
                      });
                    },
                  ),
                  visBool: visPassword,
                ),
                // Input Confirm Password
                InputRegister(
                  hint: "Xác nhận mật khẩu",
                  controller: registerController.confirmController,
                  valid_input: validConfirmPassword,
                  suffixIcon: IconButton(
                    icon: visConfirmPassword
                        ? SvgPicture.asset("assets/icons/eyesoff.svg")
                        : SvgPicture.asset("assets/icons/eyeson.svg"),
                    onPressed: () {
                      setState(() {
                        visConfirmPassword = !visConfirmPassword;
                      });
                    },
                  ),
                  visBool: visConfirmPassword,
                ),
                // Hàng chứa input ngày sinh và giới tính
                Row(
                  children: [
                    // Input giới tính
                    Obx(
                      () => Expanded(
                        child: InputRegister(
                          hint: registerController.gender.value,
                          suffixIcon: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              elevation: 0,
                              iconSize: 32,
                              // lấy dữ liệu từ GenderModel và map ra
                              items:
                                  GenderModel().genderList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(
                                    value.toString(),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  registerController.gender.value = value!;
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
                          hint: DateFormat.yMd()
                              .format(registerController.selectedDate.value),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset("assets/icons/calendar.svg"),
                            onPressed: () {
                              getDateFromUser(context);
                            },
                          ),
                          visBool: false,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Tôi đồng ý tất cả các điều khoản để gia nhập\nTwinSocial",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 24.0),
                      minimumSize: Size.fromHeight(50),
                      primary: AppColors.baseOrangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // <-- Radius
                      ),
                    ),
                    onPressed: onClickRegister,
                    child: loadingController.isLoading.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Vui lòng chờ ...',
                                style: textLoadingRegister,
                              ),
                            ],
                          )
                        : Text(
                            "Đăng Ký",
                            style: textbtnRegister,
                          )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
