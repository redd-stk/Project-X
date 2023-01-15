import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;
  Location _location = Location();
  late LocationData _locationData;
  late Marker _marker;

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        _locationData = locationData;
        _marker = Marker(
          markerId: MarkerId("current_location"),
          position:
              LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
          infoWindow: InfoWindow(
            title: "Your current location",
            snippet:
                "Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}",
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target:
              LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0),
          zoom: 16,
        ),
        markers: _locationData != null ? Set.of([_marker]) : Set(),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
