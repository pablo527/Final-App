import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redmartini_mobile_flutter/src/pages/categories/categories.list.dart';
import 'package:redmartini_mobile_flutter/src/providers/products.provider.dart';
import 'package:redmartini_mobile_flutter/src/providers/shopping_car.provider.dart';
import 'package:redmartini_mobile_flutter/src/providers/user.provider.dart';
import 'package:redmartini_mobile_flutter/src/routes/routes.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

class MartiniApp extends StatelessWidget {
  const MartiniApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCarProvider())
      ],
      child: MaterialApp(
        title: brandTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getMartiniRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => CategoriesPage());
        },
      ),
    );
  }
}
