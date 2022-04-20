import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/LoadingCtrl.dart';
import 'package:twin_social_network/Controllers/LoginCtrl.dart';
import 'package:twin_social_network/Components/Login/input_field.dart';
import 'package:twin_social_network/Components/Login/styles.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Screens/Home/HomeScreen.dart';
import 'package:twin_social_network/Utils/Utils.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final globalkey = GlobalKey<FormState>();
  bool visPassword = true;
  var loginController = Get.put(LoginController());
  var loadingController = Get.put(LoadingController());

  @override
  void initState() {
    super.initState();
    loginController.emailController.addListener(() => setState(() {}));
  }

  void onClickLogin() async {
    globalkey.currentState!.validate(); //check validation from login
    loginController.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: AppColors.baseGrey10Color,
        child: SingleChildScrollView(
          child: Form(
            key: globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Xin Chào!",
                  style: textheaderLogin,
                ),
                Text(
                  "Đăng nhập để tiếp tục",
                  style: textheaderLoginTwo,
                ),
                // input_field nhập Email
                InputLogin(
                  hint: "email",
                  controller: loginController.emailController,
                  valid_input: validEmail,
                  suffixIcon: loginController.emailController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () =>
                              loginController.emailController.clear(),
                        ),
                  visBool: false,
                ),
                // input_field nhập Password
                InputLogin(
                  hint: "password",
                  controller: loginController.passwordController,
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment
                      .center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    "Quên mật khẩu?",
                    style: textForgotPass,
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
                    onPressed: onClickLogin,
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
                                style: textLoadingLogin,
                              ),
                            ],
                          )
                        : Text(
                            "Đăng Nhập",
                            style: textbtnLogin,
                          )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
