import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(product) {
    cart.add(product);
  }

  void removeProduct(product) {
    cart.remove(product);
  }
}
