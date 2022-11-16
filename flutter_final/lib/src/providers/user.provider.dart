import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _firtsName;
  String _secondFirtsName;
  String _firtsLastName;
  String _secondLastName;
  String _image;

  get firtsName {
    return _firtsName;
  }

  set firtsName(String firtsName) {
    this._firtsName = firtsName;

    notifyListeners();
  }

  get secondFirtsName {
    return _secondFirtsName;
  }

  set secondFirtsName(String secondFirtsName) {
    this._secondFirtsName = secondFirtsName;

    notifyListeners();
  }

  get firtsLastName {
    return _firtsLastName;
  }

  set firtsLastName(String firtsLastName) {
    this._firtsLastName = firtsLastName;

    notifyListeners();
  }

  get secondLastName {
    return _secondLastName;
  }

  set secondLastName(String secondLastName) {
    this._secondLastName = secondLastName;

    notifyListeners();
  }

  get image {
    return _image;
  }

  set image(String image) {
    this._image = image;

    notifyListeners();
  }
}
