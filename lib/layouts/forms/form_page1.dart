
import 'package:bubble_saloon/modules/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyCustomForm1 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return customform1state();
  }
}
// ignore: camel_case_types
class customform1state extends  State<MyCustomForm1> {
   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
  TextEditingController certificateController = TextEditingController();
   TextEditingController addressController = TextEditingController();
   TextEditingController aboutController = TextEditingController();
   TextEditingController cityController = TextEditingController();
   String uid = "ax3" ;
   String s ;
   List Services = [];
   List<TimeEntry>  Times= [] ;





  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String response = "";

  bool menValue = true;
  bool womenValue =true;
  bool childValue =false;


  List listings = List<Widget>();


  updateUser() async {

    var result = await http_post("Updateuser", {
      "name":nameController.text,
      "email":emailController.text,
      "location" :cityController.text,
      "mobile":int.parse(mobileController.text),
      "certifiednumber":certificateController.text,
      "Address":addressController.text,
      "about":aboutController.text,
      "men":menValue,
      "women":womenValue,
      "child":childValue

    });
    if(result.ok)
    {
      setState(() {
        response = result.data['status'];
        if(response == "OK") {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => testo()));
        }
      });
    }
  }
  List<Widget> getListings() {

print("inside");
        listings.add(
          ServiceCard()
        );

    return listings;
  }

   Future<void> getUser() async{
    print(nameController.text);
    var result = await http_get("getuser",{
    "uid" : uid
    });
    if(result.ok){
      print(result.data.runtimeType);
      setState(() {
        var users = result.data as List<dynamic>;
        users.forEach((res) {
          this.emailController..text = res['email'];
          this.mobileController.text = res['contact'].toString();
          this.nameController.text = res['shop_name'];
          this.addressController.text = res['salon_address'];
          this.cityController.text = res['district'];
          this.certificateController.text = res['certification_number'];
          this.aboutController.text = res['about'];
          this.s = res['services'];
          this.Services =  s.split(",");
        });

        


      });

      print(nameController.text);
    }
  }

   Future<void> getTime() async{

     var result = await http_get("getTime",{
       "uid" : uid
     });
     if(result.ok){

       setState(() {
         var t = result.data as List<dynamic>;
         t.forEach((res) {
           Times.add(TimeEntry(res['day'],res['is_open'] ,res['break_end'] , res['break_start'], res['close_time'], res['open_time']));
         });




       });

       print(nameController.text);
     }
   }
  // createUser() async {
  //
  //   var result = await http_post("createuser", {
  //     "name":nameController.text,
  //   });
  //   if(result.ok)
  //   {
  //     setState(() {
  //       response = result.data['status'];
  //     });
  //   }
  // }

  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.currentUser().then((value) {
      uid = value.uid;
      print(uid);
      getUser();
    } );
    listings = <Widget>[];


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:(Color(0xFF674ea7)),
        title: new Text(
          'Edit Profile',
        ),
      ),
      body: new SingleChildScrollView(
        child: new Container(

          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _formKey,

            child: FormUI(),
          ),
        ),
      ),
    );



  }

  Widget ServiceCard() {
    String name = "rfsd";
    double price = 29.0;
    int duration = 30;
    TextEditingController c = TextEditingController();
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
      TextField(

        controller:new TextEditingController() ,

        decoration: InputDecoration(
          hintText: "Decorator"
        ),
      )

        ],
      ),
    );
  }
  Widget FormUI() {
    return
    Column(
      mainAxisSize: MainAxisSize.min,
        children:<Widget> [
          TextFormField(
            validator: validateName,
            controller: nameController,
            decoration: InputDecoration(
                labelText: "Enter Name",

                hintText: "Salon Name"
            ),
          ),
          TextField(
            controller:aboutController,

          maxLines:null,
            decoration: InputDecoration(


                labelText: "Description"
            ),
          ),
          TextFormField(
            validator: validateEmail,
            controller: emailController,

            enabled: false,
            decoration: InputDecoration(


                labelText: "Email"
            ),
          ),
          TextFormField(
            controller: mobileController,
            validator: validateMobile,
            decoration: InputDecoration(


                labelText: "Mobile Number"
            ),
          ),
          TextFormField(
            controller: certificateController,
            validator:validateCNumber,
            enabled: false,

            decoration: InputDecoration(


              labelText: "Certified Number"
            ),
            readOnly: true,
          ),


          TextFormField(
            controller:addressController,
            validator: validateLocation,
            decoration: InputDecoration(
                labelText: "Address"
            ),
          ),
          TextFormField(
            controller: cityController,

            decoration: InputDecoration(
                labelText: "City"
            ),
          ),
         // Text("Provide Services For :",textAlign: TextAlign.left,),

              // checkbox("Men", menVal),
              // checkbox("Women", womenVal),
              // checkbox("Children", childVal),
          Padding(
            padding:const EdgeInsets.symmetric(vertical:10.0),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Services For : "),
          ),
              CheckboxListTile(
                title: const Text('Men'),
                value:menValue,
                onChanged: (bool value) {
                  setState(() {
                       menValue = !menValue;
                  });
                },
                secondary: const Icon(Icons.face_outlined),
              ),
          CheckboxListTile(
            title: const Text('Women'),
            value:womenValue,
            onChanged: (bool value) {
              setState(() {
                womenValue = !womenValue;
              });
            },
            secondary: const Icon(Icons.face),
          ),

          CheckboxListTile(
            title: const Text('Children'),
            value:childValue,
            onChanged: (bool value) {
              setState(() {
               childValue = !childValue;
              });
            },
            secondary: const Icon(Icons.face_retouching_natural),
          ),
          Divider(
            color: Colors.black26,
          ),
          Align(
            alignment:Alignment.centerLeft,
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton.icon(

                    onPressed: () async {
                      List<ServiceEntry> persons = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SOF(uid),
                        ),
                      );
                      if (persons != null) persons.forEach(print);
                    }
                    , icon:Icon(Icons.add), label:Text("Configure Services")),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:5.0),
                ),

                ListView.separated(

                  shrinkWrap: true,
                  separatorBuilder: (context, i) => Divider(),
                  itemCount:Services.length ,
                  itemBuilder: (context, i) => ListTile(

                    leading: CircleAvatar(child: Icon(Icons.bubble_chart,color: Colors.white,),),
                     // leading:Row(
                     //   children: [
                     //    Column(
                     //      children: [
                     //        CircleAvatar(child:IconButton(icon:Icon(Icons.bubble_chart,color: Colors.white,) ),),
                     //        Text("60 min")
                     //      ],
                     //    ),
                     //     Column(
                     //       children: [
                     //         CircleAvatar(child:IconButton(icon:Icon(Icons.bubble_chart,color: Colors.white,) ),),
                     //         Text("60 min")
                     //       ],
                     //     ),
                     //
                     //   ],
                     //
                     //   ),


                      title:Text(Services[i])

                  ),
                )
              ],
            ),

          ),
          Divider(
            color: Colors.black26,
          ),
          Align(
            alignment:Alignment.center,
            child: RaisedButton.icon(
              //
              // onPressed:() {
              //   setState(() {
              //     listings.add(ServiceCard());
              //   });
              // }
                onPressed: () async {
                  List<ServiceEntry> persons = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Time(),
                    ),
                  );
                  if (persons != null) persons.forEach(print);
                }
                , icon:Icon(Icons.add), label:Text("Configure Time")),

          ),






           ListView.builder(

             shrinkWrap: true,
              itemCount: Times.length,
              itemBuilder: (context, i) =>ListTile(
                title:Column(
                  children: [
                    Times[i].day == 1?Row(children: [
                     Text("Monday"),
                      // Text(Times[i].open_time)

                    ],):null
                  ],
                ),
              ),
            ),
          Padding(
            padding:const EdgeInsets.symmetric(vertical:10.0),
          ),

          Align(
           alignment: Alignment.centerRight,
          child:
          new RaisedButton(
            color: Colors.deepPurple[400],
            onPressed: (){
              _validateInputs();
              if(_validateInputs()){
                // updateUser();
              }
            },
          //  onPressed: _validateInputs,
            child: new Text('Save',style: TextStyle(color: Colors.white),),
          ))
        ],
//        child: RaisedButton(
//            child: Text('Back To HomeScreen'),
//            color: Theme.of(context).primaryColor,
//            textColor: Colors.white,
//            onPressed: () => Navigator.pop(context)

      );

  }

   String validateName(String value) {
     if (value.length < 2)
       return 'Name must be more than 1 charater';
     else
       return null;
   }



   String validateEmail(String value) {
     Pattern pattern =
         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
     RegExp regex = new RegExp(pattern);
     if (!regex.hasMatch(value))
       return 'Enter Valid Email';
     else
       return null;
   }

   String validateLocation(String value) {
     if (value.length < 25)
       return 'Location must have No and the correct post Address';
     else
       return null;
   }

   String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
     if (value.length != 10)
       return 'Mobile Number must be of 10 digit';
     else
       return null;
   }

   String validateCNumber(String value) {
     //shop Certified Number should be less than 10
     if (value.length <10)
       return 'Please enter the Valid Certified Number';
     else
       return null;
   }
  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        // _autoValidate = true;
      });
    }
    return true;
  }
}

class ServiceEntry {
  final String name;
  final double price;
  final int duration;

  ServiceEntry(this.name, this.price, this.duration);
  @override
  String toString() {
    return 'Person: name= $name, price= $price, duration= $duration';
  }
}

class TimeEntry {
  int day;
  int is_open;
  DateTime open_time;
  DateTime close_time;
  DateTime break_start;
  DateTime break_end;

 TimeEntry(this.day,this.is_open,this.break_end,this.break_start,this.close_time,this.open_time);

}


class SOF extends StatefulWidget {
  String uid="fDaTajUTXJgKe442t0tuexqhxki1";
  SOF(this.uid);
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var nameTECs = <TextEditingController>[];
  var priceTECs = <TextEditingController>[];
  var durationTECs = <TextEditingController>[];
  var cards = <Card>[];
  String uid="fDaTajUTXJgKe442t0tuexqhxki1";
  bool menValue = true;
  bool womenValue =true;
  bool childValue =false;



  // Future<void> getUser() async{
  //
  //   var result = await http_get("getuser",{
  //     "uid" : uid
  //   });
  //   if(result.ok){
  //     print(result.data.runtimeType);
  //     setState(() {
  //       var users = result.data as List<dynamic>;
  //       users.forEach((res) {
  //         this.emailController.text = res['email'];
  //         this.mobileController.text = res['contact'].toString();
  //         this.nameController.text = res['shop_name'];
  //         this.addressController.text = res['salon_address'];
  //         this.cityController.text = res['district'];
  //         this.certificateController.text = res['certification_number'];
  //         this.aboutController.text = res['about'];
  //       });
  //
  //
  //
  //
  //     });
  //
  //   }
  // }
  updateServices(services)async{
    print(services);
    var result = await http_post("updateServices", {
      "id":uid,
      "name" :services.name,
      "price":services.price,
      "duration":services.duration,
      "female":womenValue,
      "male":menValue,
      "child":childValue,
      "category":"Hair"
    });


  }

  Card createCard() {
    var nameController = TextEditingController();
    var priceController = TextEditingController();
    var durationController = TextEditingController();
    nameTECs.add(nameController);
    priceTECs.add(priceController);
   durationTECs.add(durationController);
    return Card(
      elevation: 10.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
          ),
          Text('Service',style: TextStyle(fontSize: 14.0,fontStyle: FontStyle.italic),),
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'name of the service')),
          TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'price')),
          TextField(
              controller:durationController,
              decoration: InputDecoration(labelText: 'duration')),

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    print("Inside Done");
    List<ServiceEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      var price = double.parse(priceTECs[i].text);
      var duration =int.parse(durationTECs[i].text);
      entries.add(ServiceEntry(name,price,duration));
    }
    updateServices(entries[0]);
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('add new'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

//time
class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  var nameTECs = <TextEditingController>[];
  var priceTECs = <TextEditingController>[];
  var durationTECs = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();
    var priceController = TextEditingController();
    var durationController = TextEditingController();
    nameTECs.add(nameController);
    priceTECs.add(priceController);
    durationTECs.add(durationController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Person ${cards.length + 1}'),
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name')),
          TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'price')),
          TextField(
              controller:durationController,
              decoration: InputDecoration(labelText: 'Study/duration')),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<ServiceEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      var price = double.parse(priceTECs[i].text);
      var duration =int.parse(durationTECs[i].text);
      entries.add(ServiceEntry(name,price,duration));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child:Column(
        children: <Widget>[
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Monday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Tuesday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Wednesday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Thursday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Friday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Saturday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Card(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                Text('Sunday'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),
                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text('Opening Hours '),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Closing Hours"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

                new Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Start at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),
                    new Flexible(
                      child: new FlatButton(
                        color: Colors.deepPurple[100],
                        child: Text("Break Ends at"),
                        onPressed: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ],
      )),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}