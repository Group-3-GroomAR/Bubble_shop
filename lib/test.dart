// ignore: unused_import
import 'package:bubble_saloon/firstscreen.dart';
// ignore: unused_import
import 'package:bubble_saloon/main.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bubble_saloon/modules/auth.dart';



void main() {
  runApp(testo());
}

// ignore: camel_case_types
class testo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return testostate();
  }
}


// ignore: camel_case_types
class testostate extends State<testo> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = GoogleSignIn();

//   AuthService myauth;
  //  final AuthService myauth = AuthService() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('GroomAR'),

      ),
      body: Center(
          child:
          Column(

            children: [

              RaisedButton(
                onPressed: () {
//                   myauth._handleSignIn;
                },
                child: Text("Go Home"),
              )
            ],
          )

      ),


    );
  }
}

