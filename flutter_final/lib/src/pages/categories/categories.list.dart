import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:redmartini_mobile_flutter/src/http/categories.http.dart';
import 'package:redmartini_mobile_flutter/src/pages/categories/widgets/drawer.dart';
import 'package:redmartini_mobile_flutter/src/pages/products/products.list.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/widgets/appbar.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Future<List<dynamic>> _categories;
  FlutterSecureStorage storage;
  String _value;

  @override
  void initState() {
    super.initState();
    _categories = categoriesProvider.getData();
    storage = new FlutterSecureStorage();
  }

  @override
  void dispose() {
    super.dispose();
    storage = null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: appBarRedMartini("Categorias", false, context),
          backgroundColor: whiteColor,
          body: SafeArea(
            child: FutureBuilder(
              future: _categories,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount:
                          null == snapshot.data ? 0 : snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListsProducts(
                                        categorie: snapshot.data[index]
                                            ["categorie"])))
                          },
                          child: Card(
                            color: blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            margin: EdgeInsets.all(15.0),
                            shadowColor: blackColor,
                            elevation: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Column(
                                children: <Widget>[
                                  FadeInImage.memoryNetwork(
                                    image: snapshot.data[index]["img"],
                                    placeholder: kTransparentImage,
                                    fadeInDuration: Duration(seconds: 1),
                                    fit: BoxFit.cover,
                                    height: 150.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                        snapshot.data[index]["categorie"],
                                        style: TextStyle(color: whiteColor)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          drawer: DrawerRedMartini(),
        ),
        onWillPop: () async => false);
  }
}
