import 'package:flutter/material.dart';

import 'cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  void addCartItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (cartItem) => CartItem(
                cartItemId: cartItem.cartItemId,
                title: cartItem.title,
                price: cartItem.price,
                quantity: cartItem.quantity + 1,
              )); // .. increase quantity
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                cartItemId: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              )); // .. add item
    }
    notifyListeners();
  }

  void removeItem(String cartItemId) {
    _items.remove(cartItemId);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
