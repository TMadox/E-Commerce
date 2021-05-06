import 'package:e_commerce/TabPages/CartPage/Cartitems.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [CartItems()],
      ),
    );
  }
}
