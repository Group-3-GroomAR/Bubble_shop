

import 'package:bubble_saloon/layouts/modals/Reservation.dart';
import 'package:bubble_saloon/modules/http.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(UpcomingRes());
 
class UpcomingRes extends StatefulWidget {
  UpcomingRes({Key key}) : super(key: key);

  @override
  _UpcomingResState createState() => _UpcomingResState();
}

class _UpcomingResState extends State<UpcomingRes> {
   var myid="ax3";
   List<Reservation> reservations = [];
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
        inReservations.forEach((res){
          reservations.add(Reservation(
              res['id'],
              res['services'],
              DateTime.parse(res['date']).toLocal(),
               res['duration'],
                 res['start_time'],
              res['total'],
             res['end_time'],
           
             res['customer_id']


          ));
        });
      });
    }
   print(reservations.length);
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
            leading: Icon(Icons.event),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                 Text(reservations[i].customer_id),
                Text(reservations[i].service_name),
             Text(reservations[i].setDate()),
             Text(reservations[i].resID.toString()),

            
              
              ],
            )
           
          ),
          separatorBuilder: (context, i) => Divider(),
        ),
      ),
    );
  }
}