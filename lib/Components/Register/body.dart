import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twin_social_network/Components/Register/input_field.dart';
import 'package:twin_social_network/Components/Register/styles.dart';
import 'package:twin_social_network/Components/Register/valid.dart';
import 'package:twin_social_network/Models/Gender/GenderModel.dart';
import 'package:twin_social_network/NetWork/NetworkHandler.dart';
import 'package:intl/intl.dart';
import 'package:twin_social_network/Utils/Utils.dart';

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
  DateTime _selectedDate = DateTime.now();
  String _gender = "Nam";
  bool isLoading = false;
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
        "gender": _gender,
        "birthday": DateFormat.yMd().format(_selectedDate),
      };
      print(data);

      var responseRegister = await networkHandler.post("/register", data);

      if (responseRegister.statusCode == 200 ||
          responseRegister.statusCode == 201) {
        print("Thanh cong roi");
        setState(() {
          isLoading = true;
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            isLoading = false;
            showDialogSuccessRegister(context);
          });
        });
      } else {
        print("That bai");
        setState(() {
          isLoading = true;
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            isLoading = false;
            showDialogFaildRegister(context);
          });
        });
      }
      ;
    }
  }
  //Show Calendar
  Future<void> _getDateFromUser(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget ?child) {
        //Custom Theme Calendar
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.grey,
            splashColor: Colors.black,
            textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.black),
          ),
          colorScheme: ColorScheme.light(
            primary: AppColors.baseOrangeColor,
            primaryVariant: Colors.black,
            secondaryVariant: Colors.black,
            onSecondary: Colors.black,
            onPrimary: Colors.white,
            surface: Colors.black,
            onSurface: Colors.black,
            secondary: Colors.black),
            dialogBackgroundColor: Colors.white,
        ),
        child: child ??Text(""),
      );
    }
    initialDate: DateTime.now(),
    firstDate: DateTime(1960, 8),
    lastDate: DateTime.now()
    );
    //Nếu giá trị khi người dùng chọn trong calendar khác rỗng
    //Biến _selectedDate sẽ = giá trị người dùng chọn
    if(picked != null){
      setState(() {
        _selectedDate = picked;
      });
    }else{
      print("Some thing went wrong");
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
                // Input Họ và tên
                InputRegister(
                  hint: "Họ và tên",
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
                // Input Tên tài khoản
                InputRegister(
                  hint: "Tên tài khoản",
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
                // Input Email
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
                // Input Password
                InputRegister(
                  hint: "Mật khẩu",
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
                // Input Confirm Password
                InputRegister(
                  hint: "Xác nhận mật khẩu",
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
                // Hàng chứa input ngày sinh và giới tính
                Row(
                  children: [
                    // Input giới tính
                    Expanded(
                      child: InputRegister(
                        hint: _gender,
                        suffixIcon: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            elevation: 0,
                            iconSize: 32,
                            // lấy dữ liệu từ GenderModel và map ra
                            items: GenderModel().genderList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                        visBool: false,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Input ngày sinh
                    Expanded(
                      child: InputRegister(
                        hint: DateFormat.yMd().format(_selectedDate),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset("assets/icons/calendar.svg"),
                          onPressed: () {
                            _getDateFromUser(context);
                          },
                        ),
                        visBool: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Tôi đồng ý tất cả các điều khoản để gia nhập\nTwinSocial",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 24.0),
                      minimumSize: Size.fromHeight(50),
                      primary: AppColors.baseOrangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // <-- Radius
                      ),
                    ),
                    onPressed: validate,
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Vui lòng chờ ...',
                                style: textLoadingRegister,
                              ),
                            ],
                          )
                        : Text(
                            "Đăng Ký",
                            style: textbtnRegister,
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
