import 'package:bubble_saloon/modules/http.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:bubble_saloon/Widgets/ServiceCard.dart';

import 'form_page4.dart';

class Form3 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return customform3state();
  }
}

class ServiceList{
  String display;
  int value;

  ServiceList(this.display,this.value);
}



// Create a corresponding State class.
// This class holds data related to the form.
class customform3state extends  State<Form3>{
  bool menVal = false;
  bool womenVal = false;
  bool childVal = false;
  int _dropvalue = 1;


 List Services = [];
  // int _chipvalue = 1;
  //
  // List _listings = new List();
  List listings = List<Widget>();
  // List<Widget> _getListings(int id) {
  //  Services.forEach((element) {
  //    if(element['sid']== id){
  //      listings.add(
  //          // ServiceCard(element['ServiceName'])
  //      );
  //    }
  //  });
  //
  //
  //
  //   return listings;
  // }

  Future<void> getServices()async{
    var result = await http_get("getservice",{
      
    });
    print("requested");
    if(result.ok)
    {

      setState(() {

        Services = result.data;
        // var inReservations = result.data as List<dynamic>;
        // inReservations.forEach((res){
        //   Services.add(ServiceList(
        //      res['ServiceName'],
        //     res['sid']
        //
        //   ));
        // });
      });


    }

    print(Services);

  }

  @override
  void initState() {
    super.initState();
    getServices();
  }
  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Men":
                  menVal = value;
                  break;
                case "Women":
                  womenVal = value;
                  break;
                case "Children":
                  childVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return

        Center(
          child:Container(
              margin:EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
              child: Form(
                key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TextFormField(

                    //   decoration: InputDecoration(labelText: 'Enter your username'),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
                   Column(
                     children: [
                       Padding(child: Text("For whom your services are for :"),padding:const EdgeInsets.symmetric(vertical:10.0),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           checkbox("Men", menVal),
                           checkbox("Women", womenVal),
                           checkbox("Children", childVal),
                         ],
                       ),
                     ],
                   ),




                        Expanded(
                              flex: 1,
                              child:  DropDownFormField(
                                titleText: "Choose Your Services",
                                hintText: 'Choose and configure',
                                value: _dropvalue,
                                onSaved: (value) {

                                  setState(() {
                                    _dropvalue = value;
                                  });
                                },
                                onChanged: (value) {
                                  // _getListings(value);
                                  setState(() {
                                    _dropvalue = value;
                                  });
                                },

                                dataSource:Services,
                                textField: 'ServiceName',
                                valueField: 'sid',
                              ),

                            ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      children:listings,
                    ),
                  ),



                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                    //   child: RaisedButton(
                    //     onPressed: () {
                    //       // Validate returns true if the form is valid, or false
                    //       // otherwise.
                    //       if (_formKey.currentState.validate()) {
                    //         // If the form is valid, display a Snackbar.
                    //         Scaffold.of(context).showSnackBar(
                    //             SnackBar(content: Text('Processing Data')));
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) => MyCustomForm4 ())
                    //         );
                    //       }
                    //     },
                    //     child: Text('Submit'),
                    //   ),
                    // ),

                    RaisedButton.icon(

                        onPressed:(){
                          // _validateInputs();
                          if(true){
                            // createUser();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyCustomForm4 ())
                            );

                          }else{
                            return null;
                          }
                        }




                        , icon:Icon(Icons.navigate_next), label:Text("Next")),
                  ],
                ),
              )));









  }
}

