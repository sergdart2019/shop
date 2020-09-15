import 'package:flutter/foundation.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _data = [
    Product(
      productId: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      productId: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      productId: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      productId: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      productId: 'p5',
      title: 'White Shirt with stripes',
      description: 'White shirt, stripes - good for all occasions.',
      price: 25.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/07/31/22/59/man-407095_1280.jpg',
    ),
    Product(
      productId: 'p6',
      title: 'Brown hat',
      description: 'For those yeehaaa moments, styled in New Jersey.',
      price: 59.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/01/03/16/11/cylinder-3911269__480.png',
    ),
    Product(
      productId: 'p7',
      title: 'Army Pants',
      description: 'These are for army people. Ten-hut.',
      price: 19.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61qABJOw3eL._AC_UX385_.jpg',
    ),
    Product(
      productId: 'p8',
      title: 'Sweat pants',
      description: 'Keep on training.',
      price: 21.99,
      imageUrl:
          'https://www.free-mockup.com/wp-content/uploads/edd/2018/02/Free-Sweatpants-Mockup-PSD-1000x750.jpg',
    ),
    Product(
      productId: 'p9',
      title: 'Horse pants',
      description: 'When you want to look like a cowgirl.',
      price: 51.99,
      imageUrl:
          'https://dimg.dillards.com/is/image/DillardsZoom/mainProduct/free-people-just-float-on-flare-bell-bottom-jeans/05857685_zi_black.jpg',
    ),
    Product(
      productId: 'p10',
      title: 'White shirt',
      description:
          'Fancy shirt. This is just some random text, which is only useful to check '
          'the overflow option of the text filled inside the project and is long.',
      price: 51.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71KbL1ipXQL._AC_UL1500_.jpg',
    )
  ];

  List<Product> get data => _data;

  List<Product> get getFavorites {
    return _data.where((element) => element.isFavorite == true).toList();
  }

  Product getProduct(String id) {
    // _data.where => Iterable<Product>, iterable
    // _data.firstWhere => Product, single item
    return _data.firstWhere((product) => product.productId == id);
  }

  void addProduct(Product product) {
    _data.add(product);
    notifyListeners();
  }
}
