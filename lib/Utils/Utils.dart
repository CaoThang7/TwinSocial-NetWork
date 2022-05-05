import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Controllers/RegisterCtrl.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:get/get.dart';

var registerController = Get.put(RegisterController());
var profileController = Get.put(ProfileController());

Future<void> getDateFromUser(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    builder: (BuildContext context, Widget ?child) {
    //Custom Theme Calendar
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.grey,
        splashColor: Colors.black,
        textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.black),
        button: TextStyle(color: Colors.black),
        ),
        colorScheme: ColorScheme.light(
        primary: AppColors.baseOrangeColor,
        primaryVariant: Colors.black,
        secondaryVariant: Colors.black,
        onSecondary: Colors.black,
        onPrimary: Colors.white,
        surface: Colors.black,
        onSurface: Colors.black,
        secondary: Colors.black),
        dialogBackgroundColor: Colors.white,
      ),
      child: child ??Text(""),
    );
    }
    initialDate: DateTime.now(),
    firstDate: DateTime(1960, 8),
    lastDate: DateTime.now()
  );
    //Nếu giá trị khi người dùng chọn trong calendar khác rỗng
    //Biến selectedDate sẽ = giá trị người dùng chọn
  if(picked != null){
    registerController.selectedDate.value = picked;
    print(registerController.selectedDate);
    profileController.selectedDate.value= picked;
  }else{
    print("Some thing went wrong");
  }
}
