import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/http/products.http.dart';
import 'package:redmartini_mobile_flutter/src/models/Product.dart';
import 'package:redmartini_mobile_flutter/src/pages/details/details_screen.dart';
import 'package:redmartini_mobile_flutter/src/pages/products/components/Item_Card.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/widgets/appbar.dart';

class ListsProducts extends StatefulWidget {
  final String categorie;
  final String token;

  const ListsProducts({Key key, this.categorie, this.token}) : super(key: key);

  @override
  _ListsProductsState createState() => _ListsProductsState();
}

class _ListsProductsState extends State<ListsProducts> {
  List<Product> _products;

  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      ProductsService.getProducts(widget.categorie).then((products) {
        setState(() {
          _products = products;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarRedMartini("Productos", false, context),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(kDefaultPaddin + 4.0),
                child: Text(
                  "${widget.categorie}",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(kDefaultPaddin),
                child: GridView.builder(
                    itemCount: null == _products ? 0 : _products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      return ItemCard(
                        product: _products[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      product: _products[index],
                                    ))),
                      );
                    }),
              ))
            ],
          ),
        ));
  }
}
