import 'package:flutter/material.dart';

class CompartmentCard extends StatelessWidget {
  final String compartmentId;
  final bool rented;

  CompartmentCard(this.compartmentId, this.rented);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      height: 75,
      child: Card(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Compartment " + compartmentId,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: Checkbox(
                        value: rented,
                        checkColor: Colors.yellow,
                      )))
            ],
          ),
        ),
      ),
    ));
  }
}
