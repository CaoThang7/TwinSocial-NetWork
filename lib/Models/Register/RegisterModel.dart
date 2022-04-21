import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.fullname,
    this.username,
    required this.email,
    required this.password,
    required this.gender,
    this.birthday,
  });

  String? fullname;
  String? username;
  String email;
  String password;
  String gender;
  String? birthday;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "email": email,
        "password": password,
        "gender": gender,
        "birthday": birthday,
      };
}
