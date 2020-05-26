import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaloonHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.bubble_chart),

      ),
      body: SingleChildScrollView(

      padding: const EdgeInsets.all(12.0),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(30),

            ),

            color:createMaterialColor(Color(0xFF674ea7)) ,
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(

                  title: Text("Today's Appointments",style: TextStyle(color: Colors.white),),

                  leading: Icon(Icons.monetization_on,color: Colors.white,),

                ),
                Divider(),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Total",style: TextStyle(color: Colors.white),),
                        Text("12",style:TextStyle(fontSize: 30,color: Colors.white),)
                      ],
                    ),
                    Column(
                      children: [

                        Text("Completed",style: TextStyle(color: Colors.white),),
                        Text("3",style:TextStyle(fontSize:30,color: Colors.white),)
                      ],

                    ),

                  ],
                ),

                ButtonBar(
                  children: <Widget>[

                    FlatButton(
                      child: const Text('CHECK',style: TextStyle(color: Colors.white),),

                      onPressed: () { /* ... */ },
                    ),
                    Icon(Icons.arrow_forward,color: Colors.purple[100],
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
      ),
            elevation: 20.0,
            child: Column(

         mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(

                  title: Text("Upcoming Appointments"),
                  leading: Icon(Icons.calendar_today),
                  //subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Divider(),
//                Center(
//
//                  child: Text('No Appointments Today'),
//                ),
                ListTile(
                  title: Text("Ashlee Oakley"),
                  subtitle: Text("07/22 ,8.00"),
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/default_prof.png'),

                  ),

                ),
                ListTile(
                  title: Text("Natalie Mckenna"),
                  subtitle: Text("07/23 ,11.00"),
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/default_prof.png'),
                  ),
                ),
                ListTile(
                  title: Text("Lennon Turner"),
                  subtitle: Text("07/26 ,2.00"),
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/default_prof.png'),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('CHECK'),
                      onPressed: () { /* ... */ },
                    ),
                   Icon(Icons.arrow_forward,color: Colors.purple[100],
                   )
                  ],
                ),
              ],
            ),
          ),

          Card(
            elevation: 20.0,
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(

                  title: Text('Payout'),
                  leading: Icon(Icons.monetization_on),

                ),
                Divider(),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Current Payout *"),
                        Text("0.LKR",style:TextStyle(fontSize: 40),)
                      ],
                    ),
                    Column(
                      children: [

                        Text("Previous Payout"),
                        Text("0.LKR",style:TextStyle(fontSize:40),)
                      ],
                    )
                  ],
                ),

                ButtonBar(
                  children: <Widget>[

                    FlatButton(
                      child: const Text('CHECK'),
                      onPressed: () { /* ... */ },
                    ),
                    Icon(Icons.arrow_forward,color: Colors.purple[100],
                    )
                  ],
                ),
              ],
            ),
          ),


        ],
      )
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