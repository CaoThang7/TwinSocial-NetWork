class UserSearch {
  var id;
  var fullname;
  var username;
  var avatar;

  UserSearch({this.id, this.fullname, this.username, this.avatar});

  factory UserSearch.fromJson(Map<String, dynamic> json) {
    return UserSearch(
      id: json['_id'],
      fullname: json['fullname'],
      username: json['username'],
      avatar: json['avatar'],
    );
  }
}
