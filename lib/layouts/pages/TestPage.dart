// ignore: unused_import
import 'package:bubble_saloon/firstscreen.dart';
import 'package:bubble_saloon/layouts/forms/form_page3.dart';
import 'package:flutter/material.dart';
//signin
// ignore: unused_import
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
 

class TestPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      //  primarySwatch: Colors.blue,
        // primarySwatch: createMaterialColor(Color(0xFF674ea7)),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestPageHome(title: 'Bubble'),
    );
  }
}

class TestPageHome extends StatefulWidget {
  TestPageHome({Key key,this.title}) : super(key: key);
  final String title;
  @override
  _TestPageState createState() => _TestPageState();
}


 
class _TestPageState extends State<TestPageHome>  {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoggin=false;
//  Future<FirebaseUser> _handleSignIn() async {
//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
//     print("signed in " + user.displayName);
//     return user;
//   }


   Widget getHome() {
 
  if (isLoggin) {
 
    return Container(
    width: 150.00,
    color: Colors.green,
    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Text('Home',
            textAlign: TextAlign.center,  
            style: TextStyle(fontSize: 24, color: Colors.white)));
  } 
  
  else  {
 
    return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text("Login Here"),
                RaisedButton(onPressed: (){
                  // _handleSignIn().then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen())));
                  },
                 child: Text("Google Signin"),),
                  RaisedButton(onPressed: (){
                    
                  },
                 child: Text("Form drop down"),),
                  RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Form3()));
                  },
                 child: Text("Form"),)
              ],
            )
          );
}

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        

        // appBar: AppBar(
        //   title: Text('Material App Bar'),
        // ),
        body: Center(
         child: getHome(),
        ) ,
      ),
    );
  }
}

