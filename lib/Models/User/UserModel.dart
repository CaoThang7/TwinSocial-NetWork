import 'dart:convert';

class UserSearch {
  var id;
  var fullname;
  var username;
  var avatar;
  var followers;
  var following;

  UserSearch(
      {this.id,
      this.fullname,
      this.username,
      this.avatar,
      this.followers,
      this.following});

  factory UserSearch.fromJson(Map<String, dynamic> json) {
    return UserSearch(
      id: json['_id'],
      fullname: json['fullname'],
      username: json['username'],
      avatar: json['avatar'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}

userIdFollow userIdFollowFromJson(String str) =>
    userIdFollow.fromJson(json.decode(str));

String userIdFollowToJson(userIdFollow data) => json.encode(data.toJson());

class userIdFollow {
  userIdFollow({
    this.userId,
  });

  var userId;

  factory userIdFollow.fromJson(Map<String, dynamic> json) {
    return userIdFollow(
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
