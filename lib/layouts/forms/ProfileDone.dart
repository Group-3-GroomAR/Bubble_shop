import 'package:flutter/material.dart';
import 'package:bubble_saloon/Widgets/ServiceCard.dart';

import 'form_page4.dart';

class Donep extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return doneState();
  }
}




// Create a corresponding State class.
// This class holds data related to the form.
class doneState extends  State<Donep>{


  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
      
      body: Center(
          child:   Container(
              margin: EdgeInsets.symmetric(vertical: 100.0),
              child:Center(
                child: Column(
                  children: [
                    Text("Successfuly Created Profile for You.",  textAlign: TextAlign.center,),
                    new Image(image: new AssetImage("assets/done.gif"))

                  ],
                ) ,
              )
             ) ,
    ));








  }
}
