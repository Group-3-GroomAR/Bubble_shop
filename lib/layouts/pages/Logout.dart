import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(LogOut());
 
class LogOut extends StatefulWidget {
  LogOut({Key key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  //  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   // ignore: missing_return
  _someMethod() async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      print(user.displayName);   
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logout"),),
       body:Column(
         children: [
           Text("do you want to logout"),
           RaisedButton(onPressed:()=>_someMethod(),child:Text("Logout"))
         ],
       ),
    );
  }
}