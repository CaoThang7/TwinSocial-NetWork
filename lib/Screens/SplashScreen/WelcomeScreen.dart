import 'package:flutter/material.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:twin_social_network/Screens/Register/RegisterScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenSate createState() => WelcomeScreenSate();
}

class WelcomeScreenSate extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
