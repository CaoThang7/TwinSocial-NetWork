import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenSate createState() => HomeScreenSate();
}

class HomeScreenSate extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Home",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
