import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redmartini_mobile_flutter/src/pages/details/details_screen.dart';
import 'package:redmartini_mobile_flutter/src/providers/products.provider.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

import 'Item_Card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productsInfo = Provider.of<ProductProvider>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin + 4.0),
          child: Text(
            "Cervezas",
            style: TextStyle(
                color: blackColor, fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: GridView.builder(
              itemCount: productsInfo.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.65),
              itemBuilder: (context, index) => ItemCard(
                    product: productsInfo.products[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: productsInfo.products[index],
                                ))),
                  )),
        ))
      ],
    );
  }
}
