import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ColorsNConstants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  IconData icon;
  String hinttext;
  Function onsubmit;
  Color color;
  final height = Get.height;
  final width = Get.width;
  CustomTextField(
      {@required this.icon,
      @required this.hinttext,
      @required this.onsubmit,
      @required this.color});
  GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.04,
          left: width * 0.06,
          right: width * 0.06),
      child: TextFormField(
        onSaved: onsubmit,
        obscureText: hinttext.contains("Password") ? true : false,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            switch (hinttext) {
              case "Enter your Email":
                return "Email is empty";
              case "Enter your Password":
                return "Password is empty";
              case "Re-Enter your Password":
                return "Password repeat is empty";
              case itemname:
                return "$itemname is empty";
              case itemcategory:
                return "$itemcategory is empty";
              case itemdescription:
                return "$itemdescription is empty";
              case itemprice:
                return "$itemprice is empty";
                case itemimagelocation:
                return "$itemimagelocation is empty";
                break;
              default:
            }
          }
        },
        key: _gkey,
        cursorColor: color,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: color)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          hintText: hinttext,
          prefixIcon: Icon(
            icon,
            color: violet,
          ),
        ),
      ),
    );
  }
}
