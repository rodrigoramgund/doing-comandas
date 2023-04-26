
import 'package:comandas/data/dummy_products.dart';
import 'package:comandas/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final Map<String, Product> _items = {...DUMMY_PRODUCTS};

  List<Product> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int i) {
    return _items.values.elementAt(i);
  }
}