import 'package:flutter/material.dart';

class Availbility extends StatefulWidget {
  final String title;
  Availbility({Key key, @required this.title}) : super(key: key);
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availbility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.only(top: 75),
          child: Column(
            children: <Widget>[
              Container(
                height: 175.0,
                child: ButtonTheme(
                  minWidth: 300.0,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Compartment 1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          fontFamily: 'Monserrat',
                          color: Colors.white),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 175.0,
                child: ButtonTheme(
                  minWidth: 300.0,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Compartment 2',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          fontFamily: 'Monserrat',
                          color: Colors.white),
                    ),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
