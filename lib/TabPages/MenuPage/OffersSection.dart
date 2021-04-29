import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../Logic/FireBaseOperations.dart';
import '../../Widgets/ColorsNConstants.dart';


class OffersSection extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stream = useProvider(firebasestream);
    return Container(
      child: Column(
        children: [
          Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.only(left: width * 0.034),
              child: Text(
                "Special Offers!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                    icon: Icon(
                                                      Icons
                                                          .favorite_border_outlined,
                                                      size: 20,
                                                    ),
                                                    onPressed: () {}),
                                                IconButton(
                                                    icon: Icon(Icons
                                                        .shopping_cart_outlined),
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Image.asset(
                                            'lib/Icons/FastFood.png',
                                            scale: 11,
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
                                          document
                                                  .data()[itemprice]
                                                  .toString() +
                                              " EGP",
                                          style: TextStyle(),
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
      ),
    );
  }
}
