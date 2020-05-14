import 'package:flutter/material.dart';
import 'Calendar.dart';
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

  int _selectedPage =0 ;
  final _pageOptions = [
       Profile(),
       Calendar(),
       Manage(),
    Calendar(),
    Manage()



  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble shop',
      theme: ThemeData(
    
     primarySwatch:Colors.purple,
   
  //  primaryColor: Colors.,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title:Text('Bubble'),),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        //  backgroundColor:Colors.purple,
          currentIndex : _selectedPage,
          onTap : (int index){
            setState(() {
              _selectedPage=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: Text('Profile'),
              backgroundColor: Colors.purple
               ),
               BottomNavigationBarItem(
              icon:Icon(Icons.calendar_today),
              title: Text('Calendar'),
                backgroundColor: Colors.purple
               ),
               BottomNavigationBarItem(
              icon:Icon(Icons.card_giftcard),
              title: Text('Offers'),
                backgroundColor: Colors.purple
               ),
            BottomNavigationBarItem(
                icon:Icon(Icons.folder_shared),
                title: Text('Blog'),
                backgroundColor: Colors.purple
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.settings),
                title: Text('Settings'),
                backgroundColor: Colors.purple
            )
          ],
        ),
      )
    );
  }
}


