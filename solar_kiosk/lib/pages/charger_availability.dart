import 'package:flutter/material.dart';
import 'package:solar_kiosk/components/compartment_card.dart';

class Availbility extends StatefulWidget {
  final String title;
  Availbility({Key key, @required this.title}) : super(key: key);
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availbility> {
  bool rented = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (context, position) {
                  position = position + 1;
                  rented = !rented;
                  return CompartmentCard(position.toString(), rented);
                })));
  }
}
