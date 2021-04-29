import 'package:e_commerce/Logic/ValueStates.dart';
import 'package:e_commerce/Login.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../Logic/FireBaseOperations.dart';
import 'CategoriesSection.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: GetBuilder<States>(
        builder: (controller) => Column(
          children: [
            Categories(),
            SizedBox(
              height: height * 0.03,
            ),
            OffersSection(),
            SizedBox(
              height: height * 0.02,
            ),
            MainItemsSection(
              wanteditemcategory:
                  availablecategories[controller.categoryindex].split(",")[0],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                  loggedinuser.erase();
                },
                child: Text("test"))
          ],
        ),
      ),
    ));
  }
}
