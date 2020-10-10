import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('About Bubble'),

      ),
      body: Center(
          child:Column(
            children: [
             Text("hi"),
              Text("data")
            ],
          )
      ),


    );
  }
}