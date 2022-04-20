import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
