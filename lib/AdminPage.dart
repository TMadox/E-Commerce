import 'package:e_commerce/ItemAdditionPage.dart';
import 'package:e_commerce/Logic/ValueStates.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Logic/FireBaseOperations.dart';
import 'Widgets/ItemsTable.dart';
import 'Widgets/MainButtons.dart';

// ignore: must_be_immutable
class AdminPage extends StatelessWidget {
  final States statecontroller = Get.put(States());
  FirestoreOperations operations = new FirestoreOperations();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<States>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
              actions: [
                Visibility(
                  visible: controller.deleteselected,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      operations.deleteproduct(controller.selecteditems);
                      controller.clearselecteditemslist();
                      controller.checkselecteditems();
                    },
                  ),
                )
              ],
              backgroundColor: red,
              centerTitle: true,
              leading: IconButton(icon: Icon(Icons.logout), onPressed: () {}),
              title: Text("AdminPage")),
          body: Column(
            children: [
              ItemsTable(
                controller: controller,
              ),
              FirstButtons(
                label: "Add Item",
                onpressed: () {
                  Get.to(() => ItemAdditionPage());
                },
                color: red,
                icon: Icons.add,
              ),
            ],
          )),
    );
  }
}
