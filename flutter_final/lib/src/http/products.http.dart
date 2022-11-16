import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:redmartini_mobile_flutter/src/models/Product.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

class ProductsService {
  static Future getProducts(String productName) async {
    http.Response response =
        await http.get(baseUrl + 'product/name/' + productName);

    switch (response.statusCode) {
      case 200:
        {
          List<Product> products = productFromJson(response.body);
          return products;
        }
        break;

      case 404:
        {
          return null;
        }
        break;

      case 400:
        {
          return null;
        }
        break;
      default:
        {
          return null;
        }
        break;
    }
  }
}
