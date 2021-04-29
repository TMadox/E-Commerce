import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  final height = Get.height;
  final width = Get.width;
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Image.asset('lib/Icons/AppLogo.png'),
            width: width * 0.14,
          ),
          Container(
            child: Image.asset(
              'lib/Icons/AppTitle.png',
              color: Colors.amber,
            ),
            width: width * 0.25,
          ),
        ],
      ),
    );
  }
}
