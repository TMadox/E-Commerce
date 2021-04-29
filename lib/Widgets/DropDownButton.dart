import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'ColorsNConstants.dart';

// ignore: must_be_immutable
class DropDownList extends StatelessWidget {
  Function onchange;
  DropDownList({@required this.onchange});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.89,
      padding: EdgeInsets.only(top: height * 0.01),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: DropDown(
          items: availablecategories.map((e) => e.split(",")[0]).toList(),
          hint: Text(itemcategory),
          onChanged: onchange,
        ),
      ),
    );
  }
}
