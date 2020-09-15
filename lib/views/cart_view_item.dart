import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartViewItem extends StatelessWidget {
  final String id;
  final String cartItemId;
  final String title;
  final double price;
  final int quantity;

  const CartViewItem({
    Key key,
    this.id,
    this.cartItemId,
    this.title,
    this.price,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);
    // false here, but the cart_view is listening true, so the total rebuilds!
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => cart.removeItem(cartItemId),
      background: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(title, style: TextStyle(fontSize: 16)))),
            Container(
              width: 80,
              child: Text(
                '\$ $price  X  $quantity',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(20),
                width: 100,
                child: Text(
                  '\$ ${quantity * price}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.blueAccent),
                )),
          ],
        ),
      ),
    );
  }
}
