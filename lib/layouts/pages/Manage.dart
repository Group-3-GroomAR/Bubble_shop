import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Manage extends StatefulWidget {

  @override
  State<StatefulWidget>createState(){
    return ManageState();

  }
}


class ManageState extends State<Manage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF674ea7),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24 , top: 10),
                child:CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/prof.jpg'),
                  ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Beauty Salon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 17,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                "Wellawatta,Colombo",
                                style: TextStyle(
                                  color: Colors.white,
                                  wordSpacing: 2,
                                  letterSpacing: 1,
                                ),

                              ),
                            )
                          ],

                        )
                      ),
                    ],
                  )
              )


            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left:38,right: 38,top:15,bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "17K",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22,

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "387",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Followings",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22,

                ),
                Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top:8,bottom:8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(33)),
                    gradient:LinearGradient(
                      colors: [Color(0xff6D0E85),Color(0xff4059F1) ],
                      begin: Alignment.bottomRight,
                      end: Alignment.centerLeft,
                    )
                  ),
                  child: Text(
                    "Add Blogs",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),


              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              decoration:BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius:BorderRadius.vertical(top:Radius.circular(34))
              ),
            ),

          ),

        ],

      ),
    );
  }
}