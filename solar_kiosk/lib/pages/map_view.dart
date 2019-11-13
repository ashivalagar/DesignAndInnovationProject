import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solar_kiosk/pages/charger_availability.dart';

class GoogleMapApp extends StatefulWidget {
  @override
  _GoogleMapAppState createState() => _GoogleMapAppState();
}

class _GoogleMapAppState extends State<GoogleMapApp> {
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('Kiosk1'),
        draggable: false,
        onTap: checkKiosk,
        position: LatLng(1.342115, 103.680383)));
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.3483, 103.6831);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        markers: Set.from(allMarkers),
      ),
    );
  }

  void checkKiosk() {
    String kioskId = allMarkers[0].markerId.value;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Availbility(title: kioskId)));
  }
}
