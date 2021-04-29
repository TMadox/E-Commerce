import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Logic/FireBaseOperations.dart';
import 'package:e_commerce/Widgets/ColorsNConstants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FavouritesPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stream = useProvider(favouritesstream);
    return Container(
        child: stream.when(
      data: (value) => GridView.count(
        crossAxisCount: 3,
        children: value.docs
            .map((DocumentSnapshot document) => Card(
                  elevation: 8,
                  child: Container(
                    width: width * 0.26,
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: height * 0.04,
                            child: IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                              iconSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            document.data()[itemimagelocation],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          document.data()[itemname],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            document.data()[itemprice].toString() + " EGP",
                            style: TextStyle(color: violet),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
      loading: () => Text("Loading"),
      error: (error, stackTrace) => Text(error),
    ));
  }
}
