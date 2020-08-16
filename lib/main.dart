import 'package:bubble_saloon/layouts/pages/Home.dart';
// ignore: unused_import
import 'package:bubble_saloon/test.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:bubble_saloon/modules/http.dart';

// ignore: unused_import
import 'layouts/forms/form_page1.dart';
import 'layouts/forms/form_page2.dart';
//import 'package:bubble_saloon/modules/http.dart';


//signin
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'layouts/pages/TestPage.dart';

void main() {
  runApp(TestPage());
  //runApp(MyCustomForm());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      //  primarySwatch: Colors.blue,
        primarySwatch: createMaterialColor(Color(0xFF674ea7)),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bubble'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String response = "";

    Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child:CircleAvatar(
                    radius: 60,
                    backgroundColor:(Color(0xFF674ea7)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 55,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                //forgot password screen
              },
              textColor: Color(0xFF674ea7),
              child: Text('Forgot Password'),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child:
                RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFF674ea7),
                  child: Text('Google Sign in'),
                  onPressed: () {
                   signInWithGoogle();
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MyApphome()));
                  }

                )),
            Container(
                child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Color(0xFF674ea7),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomForm())),
                    ),

                    //Text(response),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
          ],

        ),
      )

      /*body: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: "Name"
            ),
          ),
          RaisedButton(
            child: Text("Create"),
            onPressed: createUser,
          ),
          Text(response),
        ],
      ),*/
    );
  }
  //old
/*
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
     
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            RaisedButton(
              child: Text("register"),
              onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCustomForm1()),
  );
}
            )
            
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
}


MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

 
