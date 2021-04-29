import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Logic/ValueStates.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Logic/FireBaseOperations.dart';
import 'ColorsNConstants.dart';

// ignore: must_be_immutable
class ItemsTable extends HookWidget {
  States controller;
  ItemsTable({@required this.controller});
  FirestoreOperations test = new FirestoreOperations();
  @override
  Widget build(BuildContext context) {
    final stream = useProvider(firebasestream);
    return stream.when(data: (config) {
      return Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              showBottomBorder: true,
              showCheckboxColumn: true,
              sortAscending: true,
              columns: [
                DataColumn(label: Text(itemname)),
                DataColumn(label: Text(itemcategory)),
                DataColumn(label: Text(itemdescription)),
                DataColumn(label: Text(itemprice)),
                DataColumn(label: Text(itemimagelocation)),
                DataColumn(label: Text("ID"))
              ],
              rows: config.docs.map((DocumentSnapshot document) {
                return DataRow(
                    color: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected))
                        return red.withOpacity(0.2);
                      return null;
                    }),
                    selected: controller.selecteditems.contains(document.id),
                    onSelectChanged: (value) {
                      if (controller.selecteditems.contains(document.id)) {
                        controller.removefromselecteditems(document.id);
                        controller.checkselecteditems();
                      } else {
                        controller.addtoselecteditems(document.id);
                        controller.checkselecteditems();
                      }
                    },
                    cells: [
                      DataCell(Text(document.data()[itemname])),
                      DataCell(Text(document.data()[itemcategory])),
                      DataCell(Text(document.data()[itemdescription])),
                      DataCell(Text(document.data()[itemprice].toString())),
                      DataCell(Text(document.data()[itemimagelocation])),
                      DataCell(Text(document.id))
                    ]);
              }).toList(),
            ),
          ),
        ),
      );
    }, loading: () {
      return Text("data");
    }, error: (err, stack) {
      return Text("error");
    });
  }
}
