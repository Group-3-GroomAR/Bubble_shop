import 'package:flutter/material.dart';

class testo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Wait'),

      ),
      body: Center(
          child:Text("Wait till admin verifies you")
      ),


    );
  }
}

