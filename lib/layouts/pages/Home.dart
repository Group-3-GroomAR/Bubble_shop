
import 'package:bubble_saloon/layouts/pages/Settings.dart';

import 'package:flutter/material.dart';
import 'Appointments/Calendar.dart';
import 'QR_scan/Scan.dart';
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

  int _selectedPage =0;
  final _pageOptions = [
       Profile(),
       Calendar(),
       Scan(),
    Settings()



  ];

  get _selectedTab => null;
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.center_focus_strong,color:createMaterialColor(Color(0xFF674ea7))),
          backgroundColor: Colors.white,
          elevation:30 ,
          onPressed: (){},

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
            data: IconThemeData(color:
            Theme.of(context).colorScheme.onPrimary),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                IconButton(

                  icon: Icon(Icons.home),
                  onPressed: (){
                    setState(() {
                      _selectedPage=0;
                    });
                  },
                ),
               // Spacer(),
//                IconButton(
//
//                  icon: Icon(Icons.add_location),
//                  onPressed: (){},
//                ),
         //     Spacer(),
                IconButton(

                  icon: Icon(Icons.audiotrack),
                  onPressed: (){},
                ),
          //      Spacer(),
                IconButton(

                  icon: Icon(Icons.settings),
                  onPressed: (){
                  setState(() {
                  _selectedPage=3;
                     });
                  },
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
//        bottomNavigationBar: BottomNavigationBar(
//
//      type: BottomNavigationBarType.fixed,
//
//        backgroundColor:createMaterialColor(Color(0xFF674ea7)),
//
//          currentIndex : _selectedPage,
//          onTap : (int index){
//            setState(() {
//              _selectedPage=index;
//            });
//          },
//          items: [
//            BottomNavigationBarItem(
//              icon:Icon(Icons.home,color: Colors.white,),
//              title: Text('Home'),
//
//             backgroundColor:createMaterialColor(Color(0xFF674ea7))
//               ),
//               BottomNavigationBarItem(
//              icon:Icon(Icons.calendar_today,color: Colors.white,),
//             title: Text('Calendar'),
//               backgroundColor: createMaterialColor(Color(0xFF674ea7))
//               ),
//               BottomNavigationBarItem(
//              icon:Icon(Icons.center_focus_strong,color: Colors.white,),
//              title: Text('Scan'),
//             backgroundColor:createMaterialColor(Color(0xFF674ea7))
//               ),
//
//            BottomNavigationBarItem(
//                icon:Icon(Icons.settings,color: Colors.white,),
//                title: Text('Settings'),
//               backgroundColor: createMaterialColor(Color(0xFF674ea7))
//            )
//          ],
//        ),



      )
    );
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