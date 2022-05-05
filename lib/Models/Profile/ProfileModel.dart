import 'dart:convert';

ProfileModel ProfileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.fullname,
    this.username,
    this.avatar,
    this.gender,
    this.birthday,
  });

  String? id;
  String? fullname;
  String? username;
  String? avatar;
  String? gender;
  String? birthday;

  factory ProfileModel.fromJson(Map<String?, dynamic> json) => ProfileModel(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        avatar: json["avatar"],
        gender: json["gender"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "avatar": avatar,
        "gender": gender,
        "birthday": birthday,
      };
}
