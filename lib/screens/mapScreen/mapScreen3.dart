// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../constants.dart';
import '../../size_config.dart';

class MapScreen3 extends StatefulWidget {
  const MapScreen3({super.key});

  @override
  State<MapScreen3> createState() => _MapScreen3State();
}

class _MapScreen3State extends State<MapScreen3> {
  final Completer<GoogleMapController> mapController = Completer();
  // static LatLng mySourceLocation = const LatLng(-0.303099, 36.080025);
  static LatLng destinationLocation = const LatLng(-0.303099, 36.080025);

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
      getPolyPoints();
    });

    GoogleMapController googleMapController = await mapController.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //         zoom: 15, target: LatLng(newLoc.latitude!, newLoc.longitude!))));

      if (mounted) {
        setState(() {});
      }
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result;
    if (currentLocation != null) {
      result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach(
          (PointLatLng point) =>
              polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
        );
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    // getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 214, 214),
      body: currentLocation == null
          ? Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                  SizedBox(height: getScreenHeight(10)),
                  Text("Loading")
                ],
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 14.5),
              // trafficEnabled: true,
              buildingsEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
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
                  markerId: const MarkerId("Destination Location"),
                  position: destinationLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                )
              },
              onMapCreated: (mapController1) {
                mapController.complete(mapController1);
              },
            ),
    );
  }
}
