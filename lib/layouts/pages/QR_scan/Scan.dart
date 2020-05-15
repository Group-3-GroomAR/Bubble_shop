import 'package:flutter/material.dart';

class Scan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Scan'),

      ),
      body: Center(
          child:Text("QR Camera")
        ),


    );
  }
}