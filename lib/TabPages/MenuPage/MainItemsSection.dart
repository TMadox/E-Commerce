import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../Logic/FireBaseOperations.dart';
import '../../Widgets/ColorsNConstants.dart';

// ignore: must_be_immutable
class MainItemsSection extends HookWidget {
  String wanteditemcategory;
  FirestoreOperations method = new FirestoreOperations();
  MainItemsSection({@required this.wanteditemcategory});
  @override
  Widget build(BuildContext context) {
    final stream = useProvider(firebasestream);
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.only(left: width * 0.034),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Main Menu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                InkWell(
                  child: Text(
                    "View All >  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: violet),
                  ),
                ),
              ],
            )),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
            height: height * 0.25,
            child: stream.when(
                data: (config) {
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children: config.docs
                          .where((element) =>
                              element.data()[itemcategory] ==
                              wanteditemcategory)
                          .map((DocumentSnapshot document) => Card(
                                child: Container(
                                  width: width * 0.26,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: SizedBox(
                                          height: height * 0.06,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    method.addfavourite(
                                                        document.id);
                                                  }),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    color: ember,
                                                  ),
                                                  onPressed: () {})
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          document.data()[itemimagelocation],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Text(
                                        document.data()[itemname],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        document.data()[itemprice].toString() +
                                            " EGP",
                                        style: TextStyle(color: violet),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList());
                },
                loading: () => Text("Loading"),
                error: (err, stack) => Text(err)))
      ],
    );
  }
}
