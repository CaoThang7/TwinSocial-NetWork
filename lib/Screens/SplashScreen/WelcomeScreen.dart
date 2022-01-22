import 'package:flutter/material.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:twin_social_network/Screens/RootApp/RootAppScreen.dart';

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
  // Nếu khác null 3s sau chuyển vào màn hình chính RootAppScreen()
  // Nếu null vào screen LoginScreen()
  void _checkLogin() async {
    String? token = await storage.read(key: "access_token");
    if (token != null) {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RootAppScreen()));
    } else {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350.0,
          height: 350.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/logoTwinSocial.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
