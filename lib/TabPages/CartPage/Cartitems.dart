import 'dart:ui';

import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 8,
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: AssetImage("lib/Icons/Donut.png"),
            backgroundColor: Colors.white,
          ),
          title: Text(
            "Item Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: 'Category ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: '\n\n30 EGP', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
