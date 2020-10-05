
// ignore: unused_import
import 'package:bubble_saloon/firstscreen.dart';
import 'package:bubble_saloon/layouts/forms/form_page3.dart';
import 'package:bubble_saloon/layouts/pages/S_home.dart';
import 'package:bubble_saloon/layouts/pages/Settings.dart';
import 'package:bubble_saloon/modules/auth.dart';

import 'package:flutter/material.dart';
import 'Appointments/Calendar.dart';
import 'QR_scan/Scan.dart';
import 'Profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nice_button/nice_button.dart';
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

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static var u =false;
  // var myuser = AuthService().getUser().then((value) => u = value.isAnonymous);
     
// var myuser2 = AuthService().getUser();
     

  bool isLoggin=false;

  // ignore: non_constant_identifier_names
  Color _back_col =createMaterialColor(Color(0xFF674ea7));
  int _selectedPage =4;
  var firstColor = Color(0xff5b86e5), secondColor =Color(0xFF674ea7) ;
  final _pageOptions = [
       Profile(),
       Calendar(),
       Scan(),
       Settings(),
       SaloonHome()


  ];
  
  //  Future<FirebaseUser> _handleSignIn() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  //   print("signed in " + user.displayName);
  //   return user;
  // }

<<<<<<< HEAD
  Widget getHome() {
=======
 
   Widget getHome() {
>>>>>>> d831c6eaf674ce4bc5a2af3e37c3c524512d5e4f
 
  // ignore: unrelated_type_equality_checks
  if (true) {
 
       return MaterialApp( 
          title: 'Bubble shop',
          theme: ThemeData(

<<<<<<< HEAD
          primarySwatch: createMaterialColor(Color(0xFF674ea7)),

          //  primaryColor: Colors.,
          visualDensity: VisualDensity.adaptivePlatformDensity,
=======
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
        
>>>>>>> d831c6eaf674ce4bc5a2af3e37c3c524512d5e4f
        ),
          home: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.center_focus_strong,color:createMaterialColor(Color(0xFF674ea7))),
                backgroundColor: Colors.white,
                elevation:30 ,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scan()),
                  );
                  },

            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //  appBar: AppBar(title:Text('Bubble'),),

        //Third one
//        bottomNavigationBar: FABBottomAppBar(
//          m_height:60.0 ,
//          m_color:createMaterialColor(Color(0xFF674ea7)),
//
//          onTabSelected: _selectedTab,
//          items: [
//            FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
//            FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
//            FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
//            FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
//          ],
//        ),


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
               // Spacer(),
//                IconButton(
//
//                  icon: Icon(Icons.add_location),
//                  onPressed: (){},
//                ),
            // Spacer(),
//                IconButton(
//
//                  icon: Icon(Icons.audiotrack),
//                  onPressed: (){},
//                ),
          // Spacer(),
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
        backgroundColor: Color(0xFF674ea7),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30 , top: 70),
                  child:CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10 , top: 70),
                  child: Column(
                    children: <Widget>[
                      Row(
                       children: <Widget>[
                         Text(
                           "WELCOME  TO",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize:20,
                           ),
                         ),
                       ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Text(
                            "GroomAR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize:36,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40),
                decoration:BoxDecoration(
                    color: Color(0xffEFEFEF),
                    image: DecorationImage(
                      image: AssetImage('assets/images/prof1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:BorderRadius.vertical(top:Radius.circular(34))
                ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      Container(
                        padding: const EdgeInsets.only(top:10),
                        child:Text(
                          "Please Login to Continue.....",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF674ea7),
                          ),
                        ),
                      ),
                      SizedBox(height:300),
                      Padding(
                        padding: const EdgeInsets.only(left:120),
                        child: NiceButton(
                          radius: 40,
                          padding: const EdgeInsets.all(5),
                          text: "Google SignIn",
                          gradientColors: [secondColor, firstColor],
                          onPressed: () {
                            _handleSignIn().then((value) => {
                              setState((){
                                isLoggin = true;
                              })
                            });
                          },
                        ),
                      ),
                    ],
                  )
              ),




            ),

          ],

        ),
          /*Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                Text("Login Here"),
                RaisedButton(onPressed: (){
<<<<<<< HEAD
                  _handleSignIn().then((value) => {
                    setState(() {
                      isLoggin = true;
                    })
                  }
                  );
                  },
=======
                 AuthService().handleSignIn();
    //               .then((value) => {
    //                 setState(() {
    //                   isLoggin = true;
     
    // })
                  // }
                // );
              },
>>>>>>> d831c6eaf674ce4bc5a2af3e37c3c524512d5e4f
                 child: Text("Google Signin"),)
                ],
            )
          ),*/

      )
   );

  }

  }


  @override
  Widget build(BuildContext context) {
    // print(myuser);
    return 
    getHome();


  }
}
/*
class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
 final  List<FABBottomAppBarItem>items;
 final ValueChanged<int> onTabSelected;
 final double m_height ;
 final double m_iconsize;
 final Color m_color;
 final Color m_selectedColor;


  const FABBottomAppBar({Key key, this.items, this.onTabSelected, this.m_height, this.m_iconsize, this.m_color, this.m_selectedColor}) : super(key: key);

 Color get selectedColor {
   return m_selectedColor;
 }

 Color get color {
   return m_color;
 }

 double get height{
   return m_height;
 }

  double get iconSize{
   return m_iconsize;
  }

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
*/

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