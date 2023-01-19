import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../constants.dart';

class MapScreen2 extends StatefulWidget {
  const MapScreen2({super.key});

  @override
  State<MapScreen2> createState() => _MapScreen2State();
}

class _MapScreen2State extends State<MapScreen2> {
  final Completer<GoogleMapController> _controller = Completer();

  static LatLng mySourceLocation = const LatLng(-0.303099, 36.080025);
  static LatLng destinationLocation = const LatLng(-0.300199, 36.090025);

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 14.5,
              target: LatLng(newLoc.latitude!, newLoc.longitude!))));

      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(mySourceLocation.latitude, mySourceLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    super.initState();
    // _checkLocationPermissionAndGetCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? Container(
              alignment: Alignment.center,
              child: Column(
                children: const [
                  CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                  SizedBox(height: 10),
                  Text("Loading")
                ],
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 14.5),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: appPrimaryColor,
                  width: 5,
                )
              },
              markers: {
                Marker(
                  draggable: true,
                  markerId: const MarkerId("Current Location"),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                ),
                Marker(
                  draggable: true,
                  markerId: const MarkerId("Current Location"),
                  position: destinationLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                )
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              }),
    );
  }
}
