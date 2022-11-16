import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';

PreferredSize appBarRedMartini(
    String name, bool withCenter, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  if (withCenter) {
    return PreferredSize(
      preferredSize: Size.fromHeight(52.0),
      child: AppBar(
          title: Center(
            child: Text(
              "$name",
              style: TextStyle(
                  fontSize: 17.0,
                  color: redColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3.0),
            ),
          ),
          backgroundColor: blackColor),
    );
  } else {
    return PreferredSize(
      preferredSize: Size.fromHeight(52.0),
      child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: size.width / 7),
            child: Text(
              "$name",
              style: TextStyle(
                  fontSize: 17.0,
                  color: redColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3.0),
            ),
          ),
          backgroundColor: blackColor),
    );
  }
}
