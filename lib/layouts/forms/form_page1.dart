import 'package:flutter/material.dart';
import 'package:bubble_saloon/modules/http.dart';

class MyCustomForm1 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return customform1state();
  }
}
// ignore: camel_case_types
class customform1state extends  State<MyCustomForm1> {
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
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children:<Widget> [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name"
              ),
            ),
            RaisedButton(
              child: Text("submit"),
              onPressed: createUser,
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