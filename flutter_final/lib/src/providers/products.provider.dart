import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/models/Product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  get products {
    return _products;
  }

  set products(List<Product> products) {
    this._products = products;
    notifyListeners();
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}
