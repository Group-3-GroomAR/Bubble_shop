
// ignore: unused_import
import 'package:bubble_saloon/firstscreen.dart';
import 'package:bubble_saloon/layouts/forms/form_page3.dart';
import 'package:bubble_saloon/layouts/pages/S_home.dart';
import 'package:bubble_saloon/layouts/pages/Settings.dart';
import 'package:bubble_saloon/modules/auth.dart';

import 'package:flutter/material.dart';
import 'Appointments/Calendar.dart';
import 'QR_scan/Scan.dart';
import 'Profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nice_button/nice_button.dart';
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
  static var u =false;
  var myid;


  bool isLoggin=false;

  // ignore: non_constant_identifier_names
  Color _back_col =createMaterialColor(Color(0xFF674ea7));
  int _selectedPage =4;
  var firstColor = Color(0xff5b86e5), secondColor =Color(0xFF674ea7) ;
  final _pageOptions = [
       Profile(),
       Calendar(),

       Settings(),
       SaloonHome()
  ];
  

