import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _CategoriesProvider {
  List<dynamic> categories = [];

  Future<List<dynamic>> getData() async {
    final response = await rootBundle.loadString('json/list-categories.json');
    Map dataMap = json.decode(response);
    categories = dataMap["categories"];
    return categories;
  }
}

final categoriesProvider = _CategoriesProvider();
