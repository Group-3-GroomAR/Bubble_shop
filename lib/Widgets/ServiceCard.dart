import 'package:flutter/material.dart';

Widget ServiceCard(String name, {double price, int duration}) {
  return Container(
    margin: EdgeInsets.all(20),
    child: Row(
      children: <Widget>[
       Column(children: [Text(name)],),
        Column(children: [Text(price.toString())],),
        Column(children: [Text(duration.toString())],)
      ],
    ),
  );
}
