import 'package:flutter/material.dart';

class RootAppScreen extends StatefulWidget {
  const RootAppScreen({ Key? key }) : super(key: key);

  @override
  _RootAppScreenState createState() => _RootAppScreenState();
}

class _RootAppScreenState extends State<RootAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Root App"),
      ),
    );
  }
}