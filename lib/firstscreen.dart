import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(FirstScreen());


class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  
   @override
  void initState() {
    super.initState();
    initUser();
  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
         margin:EdgeInsets.all(50),
          child: Text("${user.uid}"),
        ),
      )
    );
  }
}