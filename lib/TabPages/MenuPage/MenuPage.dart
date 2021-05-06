import 'package:e_commerce/Logic/ValueStates.dart';
import 'package:e_commerce/Login.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import '../../Logic/FireBaseOperations.dart';
import 'CategoriesSection.dart';
import 'Grabbinghandle.dart';
import 'MainItemsSection.dart';
import 'OffersSection.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  final double height = Get.height;
  final double width = Get.width;
  final States statecontroller = Get.put(States());
  final Authentication test = new Authentication();
  final auth = FirebaseAuth.instance;
  final loggedinuser = GetStorage("Loggedin");
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var container = Container(
        child: SingleChildScrollView(
      child: GetBuilder<States>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            OffersSection(),
            SizedBox(
              height: height * 0.02,
            ),
            MainItemsSection(
              wanteditemcategory:
                  availablecategories[controller.categoryindex].split(",")[0],
            ),
          ],
        ),
      ),
    ));
    return SnappingSheet(
      child: container,
      grabbingHeight: height * 0.08,
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          positionFactor: 0.93,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.75,
        ),
      ],
      grabbing: DefaultGrabbing(
        reverse: true,
      ),
      sheetAbove: SnappingSheetContent(
        childScrollController: _scrollController,
        draggable: true,
        child: Categories(
          scontroller: _scrollController,
        ),
      ),
    );
  }
}
