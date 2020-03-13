import 'package:carros_web/constants.dart';
import 'package:carros_web/web/body.dart';
import 'package:carros_web/web/breadcrumb.dart';
import 'package:carros_web/web/header.dart';
import 'package:carros_web/web/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;

  bool get showMenu => size.width > 500;
//  bool get showDrawer => size.width <= 760;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _header(),
        _body(),
      ],
    ));
  }

   _header() {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: headerHeight,
      color: Colors.blue,
      child: Header(),
    );
  }

   _body() {
    return Container(
      height: size.height - headerHeight,
      width: size.width,
      child: showMenu ? Row(
        children: <Widget>[_menu(), _right()],
      ) : _right(),
    );
  }

  _right() {
    return Container(
      width: showMenu ? size.width - menuWidth : size.width,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            width: size.width,
            height: 60,
            child: BreadCrumb(),
          ),
          Expanded(child: Body()),

        ],
      ),
    );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.grey[100],
      child: Menu(),
    );
  }
}
