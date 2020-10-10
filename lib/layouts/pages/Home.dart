
// ignore: unused_import
import 'package:bubble_saloon/firstscreen.dart';
import 'package:bubble_saloon/layouts/pages/S_home.dart';
import 'package:bubble_saloon/layouts/pages/Settings.dart';
import 'package:bubble_saloon/modules/auth.dart';

import 'package:flutter/material.dart';
import 'Appointments/Calendar.dart';
import 'QR_scan/Scan.dart';
import 'Profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(MyApphome());
}

class MyApphome extends StatefulWidget {
 
@override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApphome>{
  static var u =false;
  var myid;


  bool isLoggin=false;

  // ignore: non_constant_identifier_names
  Color _back_col =createMaterialColor(Color(0xFF674ea7));
  int _selectedPage =4;
  final _pageOptions = [
       Profile(),
       Calendar(),
       Scan(),
       Settings(),
       SaloonHome()
  ];
  

 
   Widget getHome() {
 
  // ignore: unrelated_type_equality_checks
  if (myid != null) {

       return MaterialApp( 
        title: 'Bubble shop',
        theme: ThemeData(

     primarySwatch: createMaterialColor(Color(0xFF674ea7)),

  //  primaryColor: Colors.,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.center_focus_strong,color:createMaterialColor(Color(0xFF674ea7))),
          backgroundColor: Colors.white,
          elevation:30 ,
          onPressed: (){
            setState(() {
              _selectedPage=2;

            });
          },
          // onPressed:() =>AuthService().signOutWithGoogle()
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      //Second one
        bottomNavigationBar: BottomAppBar(

          child: IconTheme(
            data: IconThemeData(color:_back_col),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: (){
                    setState(() {
                      _selectedPage=4;
                      _back_col = Colors.white;
                    });
                  },
                  splashColor: Colors.purple[50],

                ),

                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.settings),
                  onPressed: (){
                  setState(() {
                  _selectedPage=3;
                  _back_col = Colors.white;
                     });
                  },
                  splashColor: Colors.purple[50],
                )
              ],
            ),
          ),

         color:createMaterialColor(Color(0xFF674ea7)),

            shape:CircularNotchedRectangle(),
            notchMargin:8.0,

        ),

      //First one normal
      body: _pageOptions[_selectedPage],




      )
    );
  } 
  
  else  {
 
   return MaterialApp(
      title: 'Bubble shop',
      theme: ThemeData(

     primarySwatch: createMaterialColor(Color(0xFF674ea7)),

  //  primaryColor: Colors.,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body:
    Container(
            child:Center(
              child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Image.asset('assets/images/logo.png',width:230,height: 230,),
                RaisedButton(
                  onPressed: (){
                 AuthService().handleSignIn();
    //               .then((value) => {
    //                 setState(() {
    //                   isLoggin = true;

    // })
                  // }
                // );
              },
                 child: Text("Google Signin",style: TextStyle(color: Colors.white),),
                  color: Colors.deepPurple[300],

                ),


              ],
            ))
          ),
      )
   );

}

  }

  void initState() {


    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.currentUser().then((value) {
      setState(() {
        myid = value.uid;
      });

      print(myid);

    } );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return 
    getHome();
    
  }
}


//creating custom color
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