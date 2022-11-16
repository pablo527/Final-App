import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/models/Product.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

class ProductTileWhitImage extends StatelessWidget {
  const ProductTileWhitImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPaddin, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "La mejor calidad",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Precio\n", style: TextStyle(fontSize: 17.0)),
                  TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ])),
                SizedBox(
                  width: kDefaultPaddin,
                ),
                Expanded(
                    child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    product.img,
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
