import 'package:flutter/material.dart';

class CartItem {
  final String cartItemId; // not same as productId
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.cartItemId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}
