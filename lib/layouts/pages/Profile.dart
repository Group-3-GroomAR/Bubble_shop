import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Profilestate();

  }



}


class Profilestate extends State<Profile>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(

     ),
     body:ListView(
       children: <Widget>[
         Card(
           child:Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.all(10),
                   height: 100,
                   width: 100,
                   decoration:BoxDecoration(
                       image: DecorationImage(

                           image: AssetImage('assets/images/prof.jpg')
                       ),
                       shape: BoxShape.circle,
                       border:Border.all(
                           color: Colors.black,
                           width: 2
                       )


                   ) ,
                 ),
                 Text(
                   "Beauty Saloon",
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 SizedBox(height: 5),
                 Text(
                   "Our salon aim is to offer our clients the very best treatments with a honest treatment plan",
                   textAlign: TextAlign.center,
                 ),
                 SizedBox(height: 15),
                 Row(
                   children: <Widget>[
                     Icon(Icons.location_on),
                     Text(
                       "Wellawatta,Colombo",
                       style: TextStyle(fontWeight: FontWeight.w500),
                     ),
                   ],
                 ),
                 SizedBox(height: 5),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Icon(Icons.access_time),
                       ],),
                     Column(
                       children: <Widget>[
                         Column(
                           children: <Widget>[
                             Text(
                               "Opening Hours",
                               style: TextStyle(fontWeight: FontWeight.w500),
                             ),
                             Text("5:00 PM - 10:00 PM"),
                           ],
                         )

                       ],),
                     Column(
                       children: <Widget>[
                         Icon(Icons.calendar_today),
                       ],),
                     Column(
                       children: <Widget>[
                         Column(
                           children: <Widget>[
                             Text(
                               "Excluded days",
                               style: TextStyle(fontWeight: FontWeight.w500),
                             ),
                             Text("Monday"),
                           ],
                         )
                       ],
                     ),

                   ],),
                 SizedBox(height: 5),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Icon(
                           Icons.assignment_ind,

                         ),
                       ],),
                     Column(
                       children: <Widget>[
                         Column(
                           children: <Widget>[
                             Text(
                               "Sections",
                               style: TextStyle(fontWeight: FontWeight.w500),
                             ),
                             Text("Ladies Section"),
                           ],
                         )

                       ],),
                     Column(
                       children: <Widget>[
                         Icon(Icons.more),
                       ],),
                     Column(
                       children: <Widget>[
                         Column(
                           children: <Widget>[
                             Text(
                               "Facilities",
                               style: TextStyle(fontWeight: FontWeight.w500),
                             ),
                             Text("Wi-fi,Parking"),
                           ],
                         )
                       ],
                     ),

                   ],),
                 SizedBox(height: 5),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Icon(Icons.phone),
                     Column(
                       children: <Widget>[
                         Text(
                           "Contacts",
                           style: TextStyle(fontWeight: FontWeight.w500),
                         ),
                         Text("T.P- 0779987654"),
                       ],
                     ),

                   ],
                 ),
                 SizedBox(height: 20),

                 /*Divider(
                   color: Colors.black,
                   height: 40,
                 )*/
               ],
             ),
           ) ,
         ),

         Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               children: <Widget>[
                 Text(
                   "Image Gallery",
                   style: TextStyle(fontWeight: FontWeight.w500),

                 ),
                 SizedBox(height: 10),
                 Container(
                   padding: const EdgeInsets.symmetric(vertical: 0.0),
                   constraints: const BoxConstraints(maxHeight: 200.0),
                   child: new ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemBuilder: _buildHorizontalChild,
                   ),
                 ),

               ],
             ),




           ),

         Container(
           margin: EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             children: <Widget>[
               Text(
                 "Services",
                 style: TextStyle(fontWeight: FontWeight.w500),

               ),
               Row(
                 children: <Widget>[


                 ],

               ),
             ],
           ),


         ),

         Container(
           margin: EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             children: <Widget>[
                Row(
                  children: <Widget>[

                  ],
                )
             ],
           ),


         )




       ],
     )
   );


  }

}

Widget _buildHorizontalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return null;
    return new Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: new ParallaxImage(
        extent: 250.0,
        image: new ExactAssetImage(
          'assets/images/image$index.jpg',
        ),
      ),
    );
}
