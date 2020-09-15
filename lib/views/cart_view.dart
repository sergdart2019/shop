import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/cart_view_item.dart';
import '../models/cart.dart';

class CartView extends StatelessWidget {
  static const route = 'cart_view';

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            child: FlatButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Text(
                'ORDER NOW',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: cart.items.length == 0
          ? Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Your cart is empty ...',
                style: TextStyle(fontSize: 18),
              ))
          : Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Total',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '\$ ${cart.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (context, index) => CartViewItem(
                      id: cart.items.values.toList()[index].cartItemId,
                      cartItemId: cart.items.keys.toList()[index],
                      // pass key
                      title: cart.items.values.toList()[index].title,
                      price: cart.items.values.toList()[index].price,
                      quantity: cart.items.values.toList()[index].quantity,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
