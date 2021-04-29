import 'package:flutter/material.dart';
import 'Logic/FireBaseOperations.dart';
import 'Models/ItemInfo.dart';
import 'Widgets/ColorsNConstants.dart';
import 'Widgets/DropDownButton.dart';
import 'Widgets/MainButtons.dart';
import 'Widgets/TextFields.dart';

class ItemAdditionPage extends StatelessWidget {
  final GlobalKey<FormState> _gkey = GlobalKey<FormState>();
  final ItemInfo _item = new ItemInfo();
  final FirestoreOperations _operation = new FirestoreOperations();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          alignment: AlignmentDirectional.center,
          child: Form(
            key: _gkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    icon: null,
                    hinttext: itemname,
                    onsubmit: (value) {
                      _item.name = value;
                    },
                    color: red,
                  ),
                  CustomTextField(
                    icon: null,
                    hinttext: itemdescription,
                    onsubmit: (value) {
                      _item.description = value;
                    },
                    color: red,
                  ),
                  CustomTextField(
                    icon: null,
                    hinttext: itemprice,
                    onsubmit: (value) {
                      _item.price = double.parse(value);
                    },
                    color: red,
                  ),
                  CustomTextField(
                    icon: null,
                    hinttext: itemimagelocation,
                    onsubmit: (value) {
                      _item.imagelocation = value;
                    },
                    color: red,
                  ),
                  DropDownList(
                    onchange: (value) {
                      _item.category = value.toString().split(",")[0];
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  FirstButtons(
                    label: "Add Item",
                    onpressed: () {
                      if (_gkey.currentState.validate() &&
                          _item.category != null) {
                        _gkey.currentState.save();
                        _operation.addproduct(_item);
                      }
                    },
                    color: red,
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
          ),
        ),
    
    );
  }
}
