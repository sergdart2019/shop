import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../views/product_view.dart';
import '../widgets/widgets.dart';
import '../models/product.dart';

class ProductsViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    // Consumer below to rebuild only favorite button, build doesn't run!
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductView.route, arguments: product),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(product.imageUrl), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Text(product.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ))),
            ),
            Positioned(
              bottom: 42,
              left: 2,
              child: ButtonIcon(
                icon: Icons.shopping_cart,
                color: Colors.white.withOpacity(0.2),
                iconColor: Colors.blue,
                badge: false,
                onPressed: () => cart.addCartItem(
                  product.productId,
                  product.price,
                  product.title,
                ),
              ),
            ),
            Consumer<Product>(
                // Rebuilds only favorite button when clicked
                builder: (context, product, child) => Positioned(
                      bottom: 42,
                      right: 2,
                      child: ButtonIcon(
                        icon: product.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white.withOpacity(0.2),
                        iconColor: Colors.deepOrange,
                        badge: false,
                        onPressed: () => product.toggleFavorite(),
                      ),
                    ),
                child: null // The thing that never changes, and it's not rebuilt!!!,
                ),
          ],
        ),
      ),
    );
  }
}
