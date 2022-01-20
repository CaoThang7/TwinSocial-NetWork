import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Components/Login/input_field.dart';
import 'package:twin_social_network/Components/Login/styles.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _globalkey = GlobalKey<FormState>();
  bool visPassword = true;
  void validate() async {
    if (_globalkey.currentState!.validate()) {
      // login
      Map<String, String> data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      print(data);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: AppColors.baseGrey10Color,
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Xin Chào!",
                  style: textheaderLogin,
                ),
                Text(
                  "Đăng nhập để tiếp tục",
                  style: textheaderLoginTwo,
                ),
                // input_field nhập Email
                InputLogin(
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
                // input_field nhập Password
                InputLogin(
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    "Quên mật khẩu?",
                    style: textForgotPass,
                  ),
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
                        "Đăng nhập",
                        style: textbtnLogin,
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
