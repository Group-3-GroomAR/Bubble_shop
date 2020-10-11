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
  var myid="ax3";
  Color c;

  checkScan(code) async{
    var result = await http_post("checkQr", {
      "resnumber" :code,
      "shopId" : myid

    });

    if(result.data['status'] =='OK') {
      setState(() {
        response = result.data['status'];
        c = Colors.green[300];
      });
    } else{
      setState(() {
        response = result.data['status'];
        c = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar:AppBar(
            title: Text('QR SCANNING'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Text(
                    "Code",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                ),

                Text(
                  qrCodeResult,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    margin:EdgeInsets.symmetric(vertical: 0.0,horizontal:100),

                    child:
                    FlatButton(
                      padding: EdgeInsets.all(15.0),

                      onPressed: () async {


                        String codeSanner = await BarcodeScanner.scan();    //barcode scnner
                        setState(() {
                          qrCodeResult = codeSanner;
                        });

                        // try{
                        //   BarcodeScanner.scan()    this method is used to scan the QR code
                        // }catch (e){
                        //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
                        //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
                        // }

                        await checkScan(codeSanner);

                      },
                      child: Text(
                        "Scan",
                        style:
                        TextStyle(color: Color(0xFF674ea7), fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(

                          side: BorderSide(color: Color(0xFF674ea7), width: 3.0),
                          borderRadius: BorderRadius.circular(20.0)),


                    )),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  response,

                  style: TextStyle(
                      fontSize: 14.0,
                      color:c
                  ),
                  textAlign: TextAlign.center,

                ),
                // RaisedButton.icon(
                //    //we can dosable it
                //     onPressed:, icon:Icon(Icons.check_circle) ,
                //     label:Text("Confirm"))
              ],
            ),
          )


      );
  }
}




// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;


// //class Scan extends StatefulWidget{
// //
// //  @override
// //  State<StatefulWidget> createState() {
// //    return scan_page();
// //  }
// //
// //}
// //
// //
// //class scan_page extends State<Scan>{
// //
// //  TextEditingController _outputController;
// //
// //  @override
// //  initState() {
// //
// //    super.initState();
// //    this._outputController = new TextEditingController();
// //  }
// //
// //  @override
// //  Widget build(BuildContext context) {
// //    return Scaffold(
// //
// //    );
// //  }
// //
// //}










// class Scan extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<Scan> {
//   Uint8List bytes = Uint8List(0);
//   TextEditingController _inputController;
//   TextEditingController _outputController;

//   @override
//   initState() {
//     super.initState();
//     this._inputController = new TextEditingController();
//     this._outputController = new TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: Builder(
//           builder: (BuildContext context) {
//             return ListView(
//               children: <Widget>[

//                 Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: <Widget>[
//                       TextField(
//                         controller: this._outputController,
//                         readOnly: true,
//                         maxLines: 2,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.wrap_text),
//                           helperText: 'The barcode or qrcode you scan will be displayed in this area.',
//                           hintText: 'The barcode or qrcode you scan will be displayed in this area.',
//                           hintStyle: TextStyle(fontSize: 15),
//                           contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       this._buttonGroup(),
//                       SizedBox(height: 70),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),

//       ),
//     );
//   }



//   Widget _buttonGroup() {
//     return Row(
//       children: <Widget>[

//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             height: 120,
//             child: InkWell(
//               onTap: _scan,
//               child: Card(
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       flex: 2,
//                       child: Image.asset('images/scanner.png'),
//                     ),
//                     Divider(height: 20),
//                     Expanded(flex: 1, child: Text("Scan")),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

//       ],
//     );
//   }

//   Future _scan() async {
//     String barcode = await scanner.scan();
//     this._outputController.text = barcode;
//   }

//   Future _scanPhoto() async {
//     String barcode = await scanner.scanPhoto();
//     this._outputController.text = barcode;
//   }

//   Future _scanPath(String path) async {
//     String barcode = await scanner.scanPath(path);
//     this._outputController.text = barcode;
//   }

//   Future _scanBytes() async {
//     //File file = await ImagePicker.pickImage(source: ImageSource.camera);
//    // Uint8List bytes = file.readAsBytesSync();
//     String barcode = await scanner.scanBytes(bytes);
//     this._outputController.text = barcode;
//   }

//   Future _generateBarCode(String inputCode) async {
//     Uint8List result = await scanner.generateBarCode(inputCode);
//     this.setState(() => this.bytes = result);
//   }
// }