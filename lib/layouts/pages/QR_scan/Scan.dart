

import 'package:barcode_scan/barcode_scan.dart';
import 'package:bubble_saloon/modules/http.dart';
import 'package:flutter/material.dart';




class Scan extends StatefulWidget {

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrCodeResult = "Not Yet Scanned";
  String response = "";
