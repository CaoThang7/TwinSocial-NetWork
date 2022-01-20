import 'package:flutter/material.dart';

var password;
String? validFullName(value) {
  if (value!.isEmpty) {
    return "Họ tên không được bỏ trống";
  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
    return "Không được chứa số và ký tự đặc biệt";
  } else if (value!.length > 25) {
    return "Họ tên quá dài";
  } else {
    return null;
  }
}

String? validUserName(value) {
  if (value!.isEmpty) {
    return "Tên tài khoản không được bỏ trống";
  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
    return "Không được chứa số và ký tự đặc biệt";
  } else if (value!.length > 25) {
    return "Tên tài khoản quá dài";
  } else {
    return null;
  }
}

String? validEmail(value) {
  if (value!.isEmpty) {
    return "Email không được bỏ trống";
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)) {
    return "Email không đúng định dạng";
  } else {
    return null;
  }
}

String? validPassword(value) {
  password = value;
  if (password!.isEmpty) {
    return "Mật khẩu không được bỏ trống";
  } else if (password!.length < 8) {
    return "Mật khẩu quá ngắn";
  } else {
    return null;
  }
}

String? validConfirmPassword(confirmPassword) {
  if (confirmPassword!.isEmpty) {
    return "Không được bỏ trống";
  } else if (password != confirmPassword) {
    return "Xác nhận mật khẩu không trùng khớp";
  } else {
    return null;
  }
}
