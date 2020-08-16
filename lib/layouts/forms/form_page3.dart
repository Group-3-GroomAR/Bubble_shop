import 'package:flutter/material.dart';
import 'package:bubble_saloon/Widgets/ServiceCard.dart';

void main() => runApp(Form3());

class Form3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add Your Services';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  bool menVal = false;
  bool womenVal = false;
  bool childVal = false;
  int _dropvalue = 1;
  // int _chipvalue = 1;

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

    return Container(
        margin: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkbox("Men", menVal),
                  checkbox("Women", womenVal),
                  checkbox("Children", childVal),
                ],
              ),
             serviceCard("pruthi",34.5,60),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text("Choose Your services"),
                    DropdownButton(
                      value: _dropvalue,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                      ],
                      onChanged: (int value) {
                        setState(() {
                          _dropvalue = value;
                        });
                      },
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
