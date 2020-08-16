// ignore: unused_import
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Profilestate();

  }
}

class Profilestate extends State<Profile>{
  List tags=['HAIR','WAX','FACE','MAKEUP','EYEBROWS','NAILS','WEDDING'];
  List categories= ['HAIR','WAX','FACE','MAKEUP','EYEBROWS','NAILS','WEDDING'];
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
                   "Beauty Salon",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color:createMaterialColor(Color(0xFF674ea7)),
                     fontSize: 20.0,

                   ),

                 ),
                 SizedBox(height: 10),
                 Text(
                   "Our salon aim is to offer our clients the very best treatments with a honest treatment plan",
                   textAlign: TextAlign.center,

                 ),
                 SizedBox(height: 15),
                 Row(
                   children: <Widget>[
                     Icon(
                       Icons.location_on,
                       color:createMaterialColor(Color(0xFF674ea7)),
                     ),
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
                         Icon(
                           Icons.access_time,
                           color:createMaterialColor(Color(0xFF674ea7)),
                         ),
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
                         Icon(
                           Icons.calendar_today,
                           color:createMaterialColor(Color(0xFF674ea7)),
                         ),
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
                           color:createMaterialColor(Color(0xFF674ea7)),

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
                         Icon(
                           Icons.more,
                           color:createMaterialColor(Color(0xFF674ea7)),
                         ),
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
                     Icon(
                       Icons.phone,
                       color:createMaterialColor(Color(0xFF674ea7)),
                     ),
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
                 SizedBox(height: 15),
               ],
             ),
           ) ,
         ),
         SizedBox(height:5),
         Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               children: <Widget>[
                 Text(
                   "Image Gallery",
                   style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),

                 ),
                 SizedBox(height: 5),
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
         SizedBox(height: 5),
         Container(
           margin: EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             children: <Widget>[
               Text(
                 "Services",
                 style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),
               ),
             ],
           ),


         ),
         SizedBox(height: 10),
         //tag Selection
         Container(
           child: Column(
             children: <Widget>[
               Container(
                 height: 44,
                 child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: tags.length,
                     itemBuilder:(BuildContext context , int index){
                       return
                         index ==1?
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[
                           Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                border:Border.all(color:createMaterialColor(Color(0xFF674ea7))),
                              ),
                              margin: EdgeInsets.only(right:10),
                              child:Padding(
                                  padding:const EdgeInsets.only(top:13.0, bottom:5,right:20, left:20),
                                  child: Text(
                                    tags[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:createMaterialColor(Color(0xFF674ea7),),

                                      ),
                                    ),

                                  ),
                                    ),
                             CircleAvatar(radius: 2,backgroundColor:Color(0xFF674ea7),)
                           ]
                         ):
                         Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border:Border.all(color: Colors.grey),
                          ),
                          margin: EdgeInsets.only(right:10),
                          child:Padding(
                            padding:const EdgeInsets.only(top:13.0, bottom:5,right:20, left:20),
                            child: Text(
                              tags[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:createMaterialColor(Color(0xFF674ea7),

                                ),


                            ),
                            ),

                          ),
                       );
                      },
                 ),
               ),


             ],
           ),
         ),


         SizedBox(height: 15),
         Card(
           shape: RoundedRectangleBorder(
             side: BorderSide(color:createMaterialColor(Color(0xFF674ea7)), width: 2),
             borderRadius: BorderRadius.circular(10),
           ),
           elevation: 20.0,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               const ListTile(

                 title: Text("Customer Reviews",style: TextStyle(fontWeight: FontWeight.w900),),
                 leading: Icon(Icons.rate_review),
               ),
               Divider(),
//
               ListTile(
                 title: Text("Sathana Linganathan"),
                 subtitle:Text("07/22 ,8.00 - I’ve always had amazing service...."),
                 onTap: () {},
                 leading: CircleAvatar(
                   backgroundImage: AssetImage('assets/images/default_prof.png'),

                 ),

               ),
               ListTile(
                 title: Text("Pruthuvika Yoganathan"),
                 subtitle: Text("07/21 ,11.00 - Service is really appreciated..."),
                 onTap: () {},
                 leading: CircleAvatar(
                   backgroundImage: AssetImage('assets/images/default_prof.png'),
                 ),
               ),
               ButtonBar(
                 children: <Widget>[
                   FlatButton(
                     child: const Text('More Reviews'),
                     onPressed: () { /* ... */ },
                   ),
                   Icon(Icons.arrow_forward,color: Colors.purple[100],
                   )
                 ],
               ),
             ],
           ),
         ),
         SizedBox(height: 30),



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

