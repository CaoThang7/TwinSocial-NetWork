class ProfileModel {
  final String fullname;
  final String username;
  final String email;
  final String password;
  final String gender;
  final String birthday;

  const ProfileModel({
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthday,
  });

  ProfileModel copy({
    String? fullname,
    String? username,
    String? email,
    String? password,
    String? gender,
    String? birthday,
  }) =>
      ProfileModel(
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        email: email ?? this.email,
        password: fullname ?? this.password,
        gender: fullname ?? this.gender,
        birthday: fullname ?? this.birthday,
      );

  static ProfileModel fromJson(Map<String, dynamic> json) => ProfileModel(
        fullname: json['fullname'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        gender: json['gender'],
        birthday: json['birthday'],
      );

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'username': username,
        'email': email,
        'password': password,
        'gender': gender,
        'birthday': birthday,
      };
}
