import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/cart_view.dart';
import '../widgets/button_icon.dart';
import '../models/product.dart';
import '../models/products.dart';
import 'products_view_item.dart';

enum Filter { favorites, all }

class ProductsView extends StatefulWidget {
  static const route = 'products_view';

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  bool _showFavorites = false;
  List<Product> data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of<Products>(context);
    data = _showFavorites ? products.getFavorites : products.data;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Products'),
            elevation: 0,
            floating: true,
            actions: [
              // Rounded PopupMenuButton!!!
              ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 55,
                    height: 55,
                    child: PopupMenuButton(
                      child: Icon(Icons.more_vert),
                      offset: Offset(0, 60),
                      onSelected: (Filter option) {
                        setState(() {
                          if (option == Filter.all) {
                            _showFavorites = false;
                          } else {
                            _showFavorites = true;
                          }
                        });
                      },
                      itemBuilder: (_) => [
                        PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.deepOrange,
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('Only favorites'))
                              ],
                            ),
                            value: Filter.favorites),
                        PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.beenhere,
                                  color: Colors.deepOrange,
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('ShowAll'))
                              ],
                            ),
                            value: Filter.all),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: ButtonIcon(
                  iconColor: Colors.grey[800],
                  icon: Icons.shopping_cart,
                  onPressed: () => Navigator.pushNamed(context, CartView.route),
                  color: Colors.grey[50],
                  badge: true,
                ),
              )
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ChangeNotifierProvider<Product>.value(
                      value: data[index],
                      child: ProductsViewItem(),
                    ),
                childCount: data.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
            ),
          )
        ],
      ),
    );
  }
}

/*
We are not building new Product() object here, we are just using the current object,
and the .value provider type is due to caching (removing the item on scrolling),
the listView/gridView will throw error otherwise
 */
