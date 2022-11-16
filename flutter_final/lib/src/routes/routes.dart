import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/pages/categories/categories.list.dart';
import 'package:redmartini_mobile_flutter/src/pages/products/products.list.dart';

Map<String, WidgetBuilder> getMartiniRoutes() {
  return <String, WidgetBuilder>{
    '/categories': (BuildContext context) => CategoriesPage(),
    '/products': (BuildContext context) => ListsProducts(),
  };
}
