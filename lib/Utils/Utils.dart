import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Controllers/ProfileCtrl.dart';
import 'package:twin_social_network/Controllers/RegisterCtrl.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';
import 'package:get/get.dart';

var registerController = Get.put(RegisterController());
 var profileController = Get.put(ProfileController());
Future<void> showDialogFaild(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thất bại'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Đã xảy ra lỗi!'),
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Tôi đã hiểu',
              style: TextStyle(color: AppColors.baseOrangeColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showDialogSuccess(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    children: [
                      Text(
                        'Chúc mừng !!!',
                        style: textTitleSuccess,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        text,
                        style: textSuccess,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: textDialogRegister,
                                primary: Colors.redAccent,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Quay Lại")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: textDialogRegister,
                                primary: AppColors.baseOrangeColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text("Đăng nhập")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: -60,
                  child: CircleAvatar(
                    backgroundColor: AppColors.baseOrangeColor,
                    radius: 60,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 50,
                    ),
                  )),
            ],
          ));
    },
  );
}

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