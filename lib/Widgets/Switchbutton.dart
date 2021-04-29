import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';

// ignore: must_be_immutable
class SwitchButton extends StatelessWidget {
  final height = Get.height;
  final width = Get.width;
  String mode;
  Function onswitch;
  bool switchbool = false;
  SwitchButton({
    @required this.mode,
    @required this.switchbool,
    @required this.onswitch,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            mode,
            style: TextStyle(color: switchbool ? red : Colors.white),
          ),
          FlutterSwitch(
              height: height * 0.035,
              width: width * 0.15,
              padding: 4.0,
              toggleSize: 25.0,
              borderRadius: 10.0,
              activeColor: red,
              value: switchbool,
              onToggle: onswitch),
        ],
      ),
    );
  }
}
