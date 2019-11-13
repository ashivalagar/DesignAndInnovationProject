import 'package:flutter/material.dart';
import 'package:solar_kiosk/pages/test_pages.dart';
import 'package:solar_kiosk/pages/map_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navbarIndex = 0;
  List<Widget> pages = [GoogleMapApp(), Page2()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _navbarIndex,
        onTap: (int index) {
          setState(() {
            _navbarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), title: Text("Rent")),
        ],
      ),
      body: pages.elementAt(_navbarIndex),
    );
  }
}
