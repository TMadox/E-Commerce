import 'package:e_commerce/Logic/ValueStates.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final double height = Get.height;
  final double width = Get.width;
  final States statecontroller = Get.put(States());
  ScrollController scontroller;
  Categories({@required this.scontroller});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      controller: scontroller,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Divider(
                endIndent: width * 0.05,
                indent: width * 0.05,
                thickness: 1,
                color: violet,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: availablecategories
                    .map((e) => Categoryitems(
                          name: e.split(",")[0],
                          imageurl: e.split(",")[1],
                          onclick: () {
                            statecontroller.changecategoryindex(
                                availablecategories.indexOf(e));
                          },
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}

class Categoryitems extends StatelessWidget {
  final String imageurl;
  final String name;
  final Function onclick;
  Categoryitems(
      {@required this.imageurl, @required this.name, @required this.onclick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onclick,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: violet.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Image.asset(
              imageurl,
              scale: 13,
              color: violet,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Text(name)
      ],
    );
  }
}
