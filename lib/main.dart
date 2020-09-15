import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/products.dart';
import 'views/product_view.dart';
import 'views/products_view.dart';
import 'views/cart_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[50],
    systemNavigationBarColor: Colors.grey[800],
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(create: (_) => Products()),
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.blueGrey,
          // ScrollView flash color
          primaryColor: Colors.grey[50],
          // AppBar color
          scaffoldBackgroundColor: Colors.grey[50],
          // Default anyway
          primaryIconTheme: IconThemeData(color: Colors.grey[800]),
          // AppBar icon color
          primaryTextTheme: TextTheme(
              headline6: TextStyle(color: Colors.grey[800])), // AppBar title color
        ),
        routes: {
          '/': (_) => ProductsView(),
          ProductsView.route: (_) => ProductsView(),
          ProductView.route: (_) => ProductView(),
          CartView.route: (_) => CartView(),
        },
      ),
    );
  }
}

/*
22-Aug  8.3, 8.4, 8.5, 8.6, 8.7, 8.8, 8.9, 8.10
05-Sep  8.12, 8.14, 8.15, 8.16, 8.17, 8.18, 8.20, 8.21
12-Sep  8.22, 8.23, 8.24, 8.25
 */
