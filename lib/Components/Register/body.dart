import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Register/input_field.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:twin_social_network/NetWork/NetworkHandler.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool visPassword = true;
  bool visConfirmPassword = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  // Hàm onclick đăng ký check validate
  void validate() async {
    if (_globalkey.currentState!.validate()) {
      // Đẩy dữ liệu khi người dùng nhập vào lên database thông qua api register
      Map<String, String> data = {
        "fullname": _fullnameController.text,
        "username": _usernameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      print(data);

      var responseRegister = await networkHandler.post("/register", data);

      if (responseRegister.statusCode == 200 ||
          responseRegister.statusCode == 201) {
        print("Thanh cong roi");
      } else {
        print("That bai");
      }
      ;
    }
  }

  @override
  void initState() {
    super.initState();
    _fullnameController.addListener(() => setState(() {}));
    _usernameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          color: AppColors.baseGrey10Color,
          child: Form(
            key: _globalkey,
            child: Column(
              children: [
                InputRegister(
                  hint: "fullname",
                  controller: _fullnameController,
                  valid_input: validFullName,
                  suffixIcon: _fullnameController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () => _fullnameController.clear(),
                        ),
                  visBool: false,
                ),
                InputRegister(
                  hint: "username",
                  controller: _usernameController,
                  valid_input: validUserName,
                  suffixIcon: _usernameController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () => _usernameController.clear(),
                        ),
                  visBool: false,
                ),
                InputRegister(
                  hint: "email",
                  controller: _emailController,
                  valid_input: validEmail,
                  suffixIcon: _emailController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            height: 10,
                            width: 10,
                          ),
                          onPressed: () => _emailController.clear(),
                        ),
                  visBool: false,
                ),
                InputRegister(
                  hint: "password",
                  controller: _passwordController,
                  valid_input: validPassword,
                  suffixIcon: IconButton(
                    icon: visPassword
                        ? SvgPicture.asset("assets/icons/eyesoff.svg")
                        : SvgPicture.asset("assets/icons/eyeson.svg"),
                    onPressed: () {
                      setState(() {
                        visPassword = !visPassword;
                      });
                    },
                  ),
                  visBool: visPassword,
                ),
                InputRegister(
                  hint: "confirm",
                  controller: _confirmController,
                  valid_input: validConfirmPassword,
                  suffixIcon: IconButton(
                    icon: visConfirmPassword
                        ? SvgPicture.asset("assets/icons/eyesoff.svg")
                        : SvgPicture.asset("assets/icons/eyeson.svg"),
                    onPressed: () {
                      setState(() {
                        visConfirmPassword = !visConfirmPassword;
                      });
                    },
                  ),
                  visBool: visConfirmPassword,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: validate,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.baseOrangeColor),
                    child: Center(
                      child: Text(
                        "Đăng Ký",
                        style: textbtnRegister,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
