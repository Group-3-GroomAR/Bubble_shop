import 'package:bubble_saloon/layouts/pages/Settings.dart';
import 'package:bubble_saloon/main.dart';
import 'package:flutter/material.dart';
import 'Appointments/Calendar.dart';
import 'QR_scan/Scan.dart';
import 'Manage.dart';
import 'Profile.dart';

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

  int _selectedPage =2 ;
  final _pageOptions = [
       Profile(),
       Calendar(),
       Scan(),
    Settings()



  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble shop',
      theme: ThemeData(

     primarySwatch: createMaterialColor(Color(0xFF674ea7)),

  //  primaryColor: Colors.,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        //appBar: AppBar(title:Text('Bubble'),),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.shifting,

        backgroundColor:createMaterialColor(Color(0xFF674ea7)),

          currentIndex : _selectedPage,
          onTap : (int index){
            setState(() {
              _selectedPage=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home,color: Colors.white,),
              title: Text('Home'),

             backgroundColor:createMaterialColor(Color(0xFF674ea7))
               ),
               BottomNavigationBarItem(
              icon:Icon(Icons.calendar_today,color: Colors.white,),
             title: Text('Calendar'),
               backgroundColor: createMaterialColor(Color(0xFF674ea7))
               ),
               BottomNavigationBarItem(
              icon:Icon(Icons.center_focus_strong,color: Colors.white,),
              title: Text('Scan'),
             backgroundColor:createMaterialColor(Color(0xFF674ea7))
               ),

            BottomNavigationBarItem(
                icon:Icon(Icons.settings,color: Colors.white,),
                title: Text('Settings'),
               backgroundColor: createMaterialColor(Color(0xFF674ea7))
            )
          ],
        ),
      )
    );
  }
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