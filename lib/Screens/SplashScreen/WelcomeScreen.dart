import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:twin_social_network/Components/SplashScreen/body.dart';
import 'package:twin_social_network/Service/NetWork/NetworkHandler.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenSate createState() => WelcomeScreenSate();
}

class WelcomeScreenSate extends State<WelcomeScreen> {
  Widget page = WelcomeScreen();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  // Kiểm tra token từ storage khi user đăng nhập
  // Nếu khác null 3s sau chuyển vào màn hình chính homeScreen()
  // Nếu null vào screen loginScreen()
  void _checkLogin() async {
    var token = await NetworkHandler.getToken("access_token");
    if (token != null) {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Get.toNamed("/homeScreen");
    } else {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Get.toNamed("/loginScreen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Body(); // body WelcomeScreen
  }
}
