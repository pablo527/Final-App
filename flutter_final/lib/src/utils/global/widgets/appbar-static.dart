import 'package:flutter/material.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

final PreferredSize appBarRedMartiniStatic = PreferredSize(
  preferredSize: Size.fromHeight(52.0),
  child: AppBar(
    backgroundColor: redColor,
    title: Center(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                child: Text(
                  brandTitle,
                  textAlign: TextAlign.center,
                  semanticsLabel: 'Logo Red Martini',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ),
);
