// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
  
//   @override
//   void initState() {
//     super.initState();
//     _checkLocationPermissionAndGetCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GMaps.gMap(),
//     );
//   }

//   @override
//   void dispose() {
//     GMaps.mapController.dispose();
//     super.dispose();
//   }

//   void _checkLocationPermissionAndGetCurrentLocation() async {
//     var status = await Permission.location.status;
//     if (status.isGranted) {
//       GMaps.getCurrentLocation();
//     } else {
//       var requestStatus = await Permission.location.request();
//       if (requestStatus.isGranted) {
//         GMaps.getCurrentLocation();
//       }
//     }
//   }
// }

// class GMaps {
//   static late GoogleMapController mapController;
//   static LatLng mySourceLocation = const LatLng(-0.303099, 36.080025);
//   static LatLng destinationLocation = const LatLng(-0.300199, 36.090025);
//   static Geolocator geolocator = Geolocator();

//   List<LatLng> polylineCoordinates = [];

//   static Future<void> getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     var status = await Permission.location.status;
//     if (status.isGranted) {
//       position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//     } else {
//       var requestStatus = await Permission.location.request();
//       if (requestStatus.isGranted) {
//         position = await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high);
//       }
//     }

//     mySourceLocation = LatLng(position.latitude, position.longitude);
//   }

//   static GoogleMap gMap() {
//     GMaps.getCurrentLocation();
//     return GoogleMap(
//       initialCameraPosition:
//           CameraPosition(target: mySourceLocation, zoom: 15.5),
//       markers: {
//         Marker(
//           draggable: true,
//           markerId: const MarkerId("Current Location"),
//           position: mySourceLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ),
//         Marker(
//           draggable: true,
//           markerId: const MarkerId("Current Location"),
//           position: destinationLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//         )
//       },
//       onMapCreated: (GoogleMapController controller) {
//         mapController = controller;
//       },
//     );
//   }
// }
