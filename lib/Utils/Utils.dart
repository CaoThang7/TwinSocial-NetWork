import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Screens/Login/LoginScreen.dart';

Future<void> showDialogFaildRegister(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thất bại'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Đã xảy ra lỗi!'),
              Text(
                  'Bạn vui lòng xem lại họ và tên, email đã được sử dụng hoặc kiểm tra kết nối mạng.'),
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

Future<void> showDialogSuccessRegister(BuildContext context) async {
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
                        'Bạn đã đăng ký thành công',
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


