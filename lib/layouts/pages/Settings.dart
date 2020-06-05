import 'package:bubble_saloon/layouts/pages/About.dart';
import 'package:bubble_saloon/layouts/pages/Appointments/Calendar.dart';
import 'package:bubble_saloon/layouts/pages/Help.dart';
import 'package:bubble_saloon/layouts/pages/Profile.dart';
import 'package:bubble_saloon/layouts/pages/Manage.dart';

import 'package:flutter/material.dart';


class Settings extends StatelessWidget {

  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('Settings'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ACCOUNT",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                       backgroundImage: AssetImage('assets/images/prof.jpg')
                    ),
                    title: Text("Beauty Salon"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Profile()),
                      );
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Manage Blogs"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Manage()),
                      );
                    },
                    trailing: Icon(Icons.arrow_right),

                  ),
                  ListTile(
                    title: Text("Customer Reviews"),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Offers/Events"),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Check Summary"),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "APPOINTMENTS",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: Column(
                children: <Widget>[
//                  SwitchListTile(
//                    activeColor: Colors.purple,
//                    value: true,
//                    title: Text("Received notification"),
//                    onChanged: (val) {},
//                  ),

                  ListTile(
                    title: Text("Manage Upcoming Appointments"),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_right),
                  ),

                  ListTile(
                    title: Text("View Calender"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Calendar())
                      );
                    },
                    trailing: Icon(Icons.arrow_right),
                  ),

//                  ListTile(
//                    title: Text("Manage Blogs"),
//                    onTap: () {},
//                  ),
                ],
              ),
            ),
             Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child:Column(
                children:<Widget> [
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("Help"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help())
                      );
                    },
                    trailing: Icon(Icons.arrow_right),
                  ),

                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About())
                      );
                    },
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                    onTap: (){},
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              )


             ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}