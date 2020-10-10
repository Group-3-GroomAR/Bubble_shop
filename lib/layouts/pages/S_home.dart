import 'package:bubble_saloon/layouts/forms/form_page1.dart';
import 'package:bubble_saloon/layouts/forms/form_page2.dart';
import 'package:bubble_saloon/layouts/modals/Reservation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_saloon/modules/http.dart';

class SaloonHome extends StatefulWidget
{
  SaloonHome({Key key}) : super(key: key);
  @override
  s_homestate createState() => s_homestate();
}
// ignore: camel_case_types
class s_homestate extends  State<SaloonHome> {
  bool showrefresh = false;
  var myid;
  var today=new DateTime.now();
   List<Reservation> reservations = [];
   int totAp=0 ;
   int comAp=0;
   
  // bool compareDate(dateobj){
  //   print(dateobj.day == today.day);
  //   if(dateobj.day==today.day && dateobj.month == today.month && dateobj.year == today.year) return true;
  //   else return false;
  // }
  
  Future<void> refreshReserv()async{
    var result = await http_get("getreservation",{
      "uid": myid,
    });
    print("requested");
    if(result.ok)
    {
      setState(() {
        reservations.clear();
        var inReservations = result.data as List<dynamic>;
        inReservations.forEach((resv){
  reservations.add(Reservation(
              resv['id'],
              resv['services'],
              DateTime.parse(resv['date']).toLocal(),
               resv['duration'],
                 resv['start_time'],
              resv['total'],
             resv['end_time'],
             resv['customer_id'],
             resv['customer_name'],
    resv['Status']


          ));
         
        });


        reservations.forEach((element) {
          if(element.date.day == new DateTime.now().day && element.date.month == new DateTime.now().month && element.date.year == new DateTime.now().year){
            totAp =totAp+1;

            if(element.Status==1){
              comAp =comAp+1;
            }
          }



        });
      });

      print(totAp);
    }
  }
  String response = "";
 
 @override
 void initState() {


   final FirebaseAuth auth = FirebaseAuth.instance;
   auth.currentUser().then((value) {
     myid = value.uid;
     print(myid);
     refreshReserv();
   } );

    super.initState();
  }

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
                        Text(totAp.toString(),style:TextStyle(fontSize: 30,color: Colors.white),)
                      ],
                    ),
                    Column(
                      children: [

                        Text("Completed",style: TextStyle(color: Colors.white),),
                        Text(comAp.toString(),style:TextStyle(fontSize:30,color: Colors.white),)
                      ],

                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.all(20))
                // ButtonBar(
                //   children: <Widget>[

                //     FlatButton(
                //       child: const Text('CHECK',style: TextStyle(color: Colors.white),),
                //        //testing http
                //       onPressed: () { testUser();},
                //     ),
                //     Icon(Icons.arrow_forward,color: Colors.purple[100],
                //     )
                //   ],
                // ),
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
                
                // RaisedButton(
                  
                //   onPressed:refreshReserv,child:Text("click")
                //   ),
//                Center(
//
//                  child: Text('No Appointments Today'),
//                ),
                // ListView(
                //   shrinkWrap: true,
                //   children: [
                    
                //   ],
                // ),
                 ListView.separated(

                scrollDirection: Axis.vertical,
                   shrinkWrap: true,
          itemCount: reservations.length,
          itemBuilder: (context, i) => ListTile(
            
            leading: Icon(Icons.event),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text(reservations[i].customer_name),
                Text(reservations[i].service_name),
             Text(reservations[i].setDate()),
              
              ],
            )
           
          ),
          separatorBuilder: (context, i) => Divider(),
        ),
              
                ButtonBar(
                  
                  children: <Widget>[
                    Icon(Icons.refresh,color: Colors.purple[100]),
                    FlatButton(
                      child: const Text('REFRESH'),
                      onPressed:refreshReserv,
                    ),
                  //  Icon(Icons.arrow_forward,color: Colors.purple[100],
                  //  )
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
Padding(
  padding: EdgeInsets.symmetric(vertical: 20.0),
),
         // FlatButton(onPressed:() {
         //
         //
         //   // print()
         //   // Navigator.push(
         //   //     context,
         //   //     MaterialPageRoute(builder: (context) => MyCustomForm1())
         //   // );
         // }, child:Text("Test"))
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