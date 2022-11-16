import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/models/Product.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: kDefaultPaddin),
        child: Text(
          product.description,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
