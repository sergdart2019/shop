import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductView extends StatelessWidget {
  static const route = 'product_view';

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                '\$${product.price}',
                style: TextStyle(
                    fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(
                product.description,
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
