import 'package:bubble_saloon/test.dart';
import 'package:flutter/material.dart';

import 'package:bubble_saloon/modules/http.dart';


class MyCustomForm extends StatefulWidget
{
  MyCustomForm({Key key}) : super(key: key);
  @override
  customformstate createState() => customformstate();
}
class customformstate extends  State<MyCustomForm> {
  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _agreedToTOS = true;
  String response = "";

  String _name;
  String _email;
  String _location;
  String _mobile;
  String _certifiednumber;

  createUser() async {
   print(_email);
    var result = await http_post("createuser", {
      "name":_name,
      "email":_email,
      "location" : _location,
      "mobile":_mobile,
      "certifiednumber":_certifiednumber
    });
    if(result.ok)
    {
      setState(() {
        response = result.data['status'];
        if(response == "OK") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => testo()));
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor:(Color(0xFF674ea7)),
          title: new Text(
            'REGISTRATION FORM',
          ),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

// Here is our Form UI
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        //getting Salon name
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Salon Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
       //getting email
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        //getting location
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Location'),
          keyboardType: TextInputType.text,
          validator: validateLocation,
          onSaved: (String val) {
            _location = val;
          },
        ),
        //getting mobile number
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        //getting certification number which is approved by government
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Certified Number'),
          keyboardType: TextInputType.text,
          validator: validateCNumber,
          onSaved: (String val) {
            _certifiednumber = val;
          },
        ),

        /*new TextFormField(
          decoration: const InputDecoration(labelText: 'Registered Certificate'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        MaterialButton(
          color: Colors.black12,
          elevation: 8,
          highlightElevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          textColor: Colors.white,
          child: Text('Upload'),
          onPressed: () {},
        ),*/


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: _agreedToTOS,
                onChanged: _setAgreedToTOS,
              ),
              GestureDetector(
                onTap: () => _setAgreedToTOS(!_agreedToTOS),
                child: const Text(
                  'As a Salon Owner I will send all\n'
                      'the document and I agree to \n'
                      'the Terms of Services and Privacy \n'
                      'Policy behalf of Salon....',
                ),
              ),
            ],
          ),
        ),


        new RaisedButton(
          onPressed: (){
            _validateInputs();
            createUser();
          },
        //  onPressed: _validateInputs,
          child: new Text('Submit'),
        )
      ],
    );
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
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

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}