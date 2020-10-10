import 'package:flutter/material.dart';
import 'package:bubble_saloon/modules/http.dart';

import 'ProfileDone.dart';
import 'form_page3.dart';

class MyCustomForm4 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return customform4state();
  }
}
// ignore: camel_case_types
class customform4state extends  State<MyCustomForm4> {
  final TextEditingController nameController = TextEditingController();
  String response = "";
  createUser() async {

    var result = await http_post("createuser", {
      "name":nameController.text,
    });
    if(result.ok)
    {
      setState(() {
        response = result.data['status'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Time'),
      ),
      body: Center(
        child: Column(
          children:<Widget> [
            TextField(
              controller: nameController,

              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),

                  hintText: "Street address,P.O. box,etc."
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Apt,Suite,Unit,etc.(optional)"
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "State/Province"
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "City"
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical:20.0),
            ),
            RaisedButton(
                child: Text("submit"),
                onPressed:(){
                  // createUser,
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Donep())
                  );
                }

            ),
            Text(response),
          ],
//        child: RaisedButton(
//            child: Text('Back To HomeScreen'),
//            color: Theme.of(context).primaryColor,
//            textColor: Colors.white,
//            onPressed: () => Navigator.pop(context)

        ),
      ),
    );
  }
}