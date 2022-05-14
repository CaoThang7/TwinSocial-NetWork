import 'package:flutter/material.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class InputContent extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final valid_input;
  final suffixIcon;
  final bool visBool;
  final onchange;
  const InputContent(
      {Key? key,
      required this.hint,
      this.controller,
      this.widget,
      this.valid_input,
      this.suffixIcon,
      required this.visBool,
      this.onchange})
      : super(key: key);

  @override
  State<InputContent> createState() => _InputContentState();
}

class _InputContentState extends State<InputContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextFormField(
            minLines: 5,
            maxLines: 10,
            onChanged: widget.onchange,
            obscureText: widget.visBool,
            autofocus: false,
            controller: widget.controller,
            validator: widget.valid_input,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              suffixIcon: widget.suffixIcon,
              hintText: widget.hint,
              border: OutlineInputBorder(), //Hiện viền bao quanh TextFormField
              filled: true,
              fillColor: Colors.white, // Màu nền trong TextFormField
              // focusedBorder: hành động khi click vào TextFormField
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors
                        .baseGrey30Color), //Click vào viền bao quanh đổi màu
                borderRadius:
                    BorderRadius.circular(8.0), //bo tròn hoặc vuông tuỳ thích
              ),
              // enabledBorder: hành động khi chưa click vào TextFormField
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.baseGrey30Color), //Tương tự focusedBorder
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
