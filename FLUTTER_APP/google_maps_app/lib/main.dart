import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MLS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GoogleMapsPage(),
    );
  }
}

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController mapController;

  final LatLng _cairoLocation = const LatLng(30.0444, 31.2357);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _cairoLocation,
          zoom: 10.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('cairo'),
            position: _cairoLocation,
            infoWindow: InfoWindow(
              title: 'Cairo',
              
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        },
      ),
    );
  }
}
