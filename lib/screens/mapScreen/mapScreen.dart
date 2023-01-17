import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    _checkLocationPermissionAndGetCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GMaps.gMap(),
    );
  }

  @override
  void dispose() {
    GMaps.mapController.dispose();
    super.dispose();
  }

  void _checkLocationPermissionAndGetCurrentLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      GMaps.getCurrentLocation();
    } else {
      var requestStatus = await Permission.location.request();
      if (requestStatus.isGranted) {
        GMaps.getCurrentLocation();
      }
    }
  }
}

class GMaps {
  static late GoogleMapController mapController; //declare 'mapController' here
  static LatLng mySourceLocation = LatLng(-0.303099, 36.080025);
  static Geolocator geolocator = Geolocator();

  static Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var status = await Permission.location.status;
    if (status.isGranted) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } else {
      var requestStatus = await Permission.location.request();
      if (requestStatus.isGranted) {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
    }

    mySourceLocation = LatLng(position.latitude, position.longitude);
  }

  static GoogleMap gMap() {
    GMaps.getCurrentLocation();
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: mySourceLocation, zoom: 15.5),
      markers: {
        Marker(
          draggable: true,
          markerId: const MarkerId("Current Location"),
          position: mySourceLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        )
      },
      onMapCreated: (GoogleMapController controller) {
        mapController = controller; //initialize 'mapController' here
      },
    );
  }
}
