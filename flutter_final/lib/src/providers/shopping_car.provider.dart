import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/models/purchase.model.dart';

class ShoppingCarProvider with ChangeNotifier {
  List<PurchaseModel> _shoppingCar = [];
  double _total = 0;
  get shoppingCar {
    return _shoppingCar;
  }

  get total {
    this._total = 0;
    if (!(this._shoppingCar.length <= 0)) {
      this._shoppingCar.forEach((element) {
        this._total += element.price * element.userQuantity;
      });
      return _total;
    }
  }

  void addOne(PurchaseModel product) {
    PurchaseModel _product;
    for (int i = 0; i < this._shoppingCar.length; i++) {
      _product = this.shoppingCar[i];
      if (product.id == _product.id) {
        this.shoppingCar[i] = product;
        notifyListeners();
        return;
      }
    }
    this._shoppingCar.add(product);
    notifyListeners();
  }

  void removeFromCart(PurchaseModel product) {
    PurchaseModel _product;
    for (int i = 0; i < this._shoppingCar.length; i++) {
      _product = this.shoppingCar[i];
      if (product.id == _product.id) {
        this._shoppingCar.remove(product);
        notifyListeners();
        return;
      }
    }
  }

  String whatsappMessage() {
    String message = "";
    this._shoppingCar.forEach((element) {
      message += "| RED MARTINI |" +
          "| Pedido:" +
          "Producto: ${element.name} " +
          "Precio: ${element.price} " +
          "Cantidad: ${element.userQuantity} |";
    });
    return message;
  }

  void removeAll() {
    this._shoppingCar.clear();
    notifyListeners();
  }
}
