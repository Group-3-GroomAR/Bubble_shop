

import 'package:bubble_saloon/layouts/modals/Reservation.dart';
import 'package:bubble_saloon/modules/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(UpcomingRes());
 
class UpcomingRes extends StatefulWidget {
  UpcomingRes({Key key}) : super(key: key);

  @override
  _UpcomingResState createState() => _UpcomingResState();
}

class _UpcomingResState extends State<UpcomingRes> {
   var myid;
   List<Reservation> reservations = [];

  Future<void> refreshReserv()async{
    var result = await http_get("getreservation",{
      "uid": myid,
    });
    print("requested");
    if(result.ok)
    {
      print(result.data);
      setState(() {
        reservations.clear();
        var inReservations = result.data as List<dynamic>;
        inReservations.forEach((res){
          reservations.add(Reservation(
              res['id'],
              res['services'],
              DateTime.parse(res['date']).toLocal(),
               res['duration'],
                 res['start_time'],
              res['total'],
             res['end_time'],
           
             res['customer_id'],
            res['customer_name'],
            res['Status']


          ));
        });
      });


    }
   print(reservations.length);
  }

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
      appBar:  AppBar(
        title: Text("Upcoming appointments"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: (){
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context){
        //             return AddUserPage();
        //           }
        //       ));
        //     },
        //   )
        // ],
      ),
      body:  RefreshIndicator(
        
        onRefresh: refreshReserv,
        child: ListView.separated(
          itemCount: reservations.length,
          itemBuilder: (context, i) => ListTile(

            leading: CircleAvatar(
              child: Icon(Icons.today),
              radius: 30.0,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                Text("Reference : "+ reservations[i].setRef(reservations[i].resID).toString()),
                 Text("Customer Name : "+reservations[i].customer_name),
                Text(reservations[i].service_name),
             Text(reservations[i].setDate()),
                Text(reservations[i].start_time.toString()),


            
              
              ],
            )
           
          ),
          separatorBuilder: (context, i) => Divider(),
        ),
      ),
    );
  }
}