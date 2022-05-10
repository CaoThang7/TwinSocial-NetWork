import 'dart:convert';

ProfileUserModel ProfileModelFromJson(String str) =>
    ProfileUserModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileUserModel data) => json.encode(data.toJson());

class ProfileUserModel {
  ProfileUserModel({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.avatar,
    this.role,
    this.gender,
    this.birthday,
    this.mobile,
    this.address,
    this.story,
    this.followers,
    this.following,
    this.save,
    this.createdAt,
    this.updatedAt,
  });

  var id;
  var fullname;
  var username;
  var email;
  var avatar;
  var role;
  var gender;
  var birthday;
  var mobile;
  var address;
  var story;
  var followers;
  var following;
  var save;
  var createdAt;
  var updatedAt;

   factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
       return ProfileUserModel(
        id: json['_id'],
        fullname: json['fullname'],
        username: json['username'],
        email: json['email'],
        avatar: json['avatar'],
        role: json['role'],
        gender: json['gender'],
        birthday: json['birthday'],
        mobile: json['mobile'],
        address: json['address'],
        story: json['story'],
        followers: json['followers'],
        following: json['following'],
        save: json['save'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
   }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "email": email,
        "avatar": avatar,
        "role": role,
        "gender": gender,
        "birthday": birthday,
        "mobile": mobile,
        "address": address,
        "story": story,
      };
}
