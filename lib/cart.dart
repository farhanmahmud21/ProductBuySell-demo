import 'package:flutter/material.dart';

import './item_list.dart';

class Cart_Page extends StatelessWidget {
  Cart_Page({super.key});
  int getProduct() {
    int total = 0;

    for (var product in item_list) {
      total += product.counter;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Text('Total Products : ${getProduct()}'),
      ),
    );
  }
}
