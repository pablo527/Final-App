import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redmartini_mobile_flutter/src/models/Product.dart';
import 'package:redmartini_mobile_flutter/src/models/purchase.model.dart';
import 'package:redmartini_mobile_flutter/src/pages/details/components/Description.dart';
import 'package:redmartini_mobile_flutter/src/pages/details/components/Product_title_with_image.dart';
import 'package:redmartini_mobile_flutter/src/providers/shopping_car.provider.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BodyDetail extends StatefulWidget {
  final Product product;
  const BodyDetail({Key key, this.product}) : super(key: key);

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final _formKey = GlobalKey<FormState>();
  int _cantProduct = 0;
  PurchaseModel _purchase;

  _showAlert(BuildContext context, ShoppingCarProvider shoppingCar) {
    _purchase = new PurchaseModel(
        id: widget.product.id,
        name: widget.product.name,
        img: widget.product.img,
        price: widget.product.price,
        quantity: widget.product.quantity,
        userQuantity: this._cantProduct);
    return Alert(
        context: context,
        title: "¿Desea agregarlo al carrito?:",
        buttons: [
          DialogButton(
              color: redColor,
              child: Text(
                "Si",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () => {
                    shoppingCar.addOne(_purchase),
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/shop')
                  }),
          DialogButton(
              color: redColor,
              child: Text(
                "No",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () => {Navigator.pop(context)})
        ]).show();
  }

  SizedBox buildSizedBox({IconData icon, Function press}) {
    return SizedBox(
      height: 30.0,
      width: 32.0,
      child: OutlinedButton(
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCarInfo = Provider.of<ShoppingCarProvider>(context);

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.92,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.34),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      right: kDefaultPaddin,
                      left: kDefaultPaddin),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: kDefaultPaddin,
                      ),
                      Description(product: widget.product),
                      Padding(
                        padding: const EdgeInsets.only(top: kDefaultPaddin * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Cantidad en Stock: ",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text("${widget.product.quantity}",
                                style: TextStyle(fontWeight: FontWeight.w700))
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: kDefaultPaddin * 0.5,
                              right: kDefaultPaddin * 2),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                onChanged: (value) {},
                                onSaved: (value) {
                                  _cantProduct = int.parse(value);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Incorrecto';
                                  }
                                  if (value.length <= 0) {
                                    return 'Incorrecto';
                                  }
                                  if (int.parse(value) <= 0) {
                                    return 'Incorrecto';
                                  }
                                  if (int.parse(value) >
                                      widget.product.quantity) {
                                    return 'Debe ser menor a ${widget.product.quantity}';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: 14.0, color: blackColor),
                                maxLength: 2,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2)
                                ],
                                cursorColor: blackColor,
                                buildCounter: (BuildContext context,
                                        {int currentLength,
                                        int maxLength,
                                        bool isFocused}) =>
                                    null,
                                decoration: InputDecoration(
                                    hintText: "0",
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontSize: 14.0),
                                    prefixIcon: Icon(
                                      Icons.add,
                                      color: blackColor,
                                      size: 30.0,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: redColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: greenColor))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: kDefaultPaddin * 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          _showAlert(context, shoppingCarInfo);
                                        }
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: kDefaultPaddin),
                                        height: 51.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            border: Border.all(
                                              color: redColor,
                                            )),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: kDefaultPaddin),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Text(
                                                  "Enviar al carrito",
                                                  style: TextStyle(
                                                      color: blackColor,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: kDefaultPaddin),
                                              child: Icon(
                                                Icons.add_shopping_cart,
                                                color: redColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ProductTileWhitImage(product: widget.product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
