import 'dart:math';

import 'package:flutter/material.dart';

import '../../Widgets/ColorsNConstants.dart';

class DefaultGrabbing extends StatelessWidget {
  final Color color;
  final bool reverse;

  const DefaultGrabbing(
      {Key key, this.color = Colors.white, this.reverse = false})
      : super(key: key);

  BorderRadius _getBorderRadius() {
    var radius = Radius.circular(25.0);
    return BorderRadius.only(
      topLeft: reverse ? Radius.zero : radius,
      topRight: reverse ? Radius.zero : radius,
      bottomLeft: reverse ? radius : Radius.zero,
      bottomRight: reverse ? radius : Radius.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: violet.withOpacity(0.5),
            spreadRadius: height * 0.006,
            blurRadius: height * 0.02,
            offset: Offset(0, height * 0.004),
          )
        ],
        borderRadius: _getBorderRadius(),
        color: this.color,
      ),
      child: Transform.rotate(
        angle: reverse ? pi : 0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: _GrabbingIndicator(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 2.0,
                  color: Colors.grey[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GrabbingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.01),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: violet,
            ),
            height: 5,
            width: 75,
          ),
        ),
        Transform.rotate(
          angle: pi,
          child: Container(
              padding: EdgeInsets.only(bottom: width * 0.01),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18),
              )),
        ),
      ],
    );
  }
}
