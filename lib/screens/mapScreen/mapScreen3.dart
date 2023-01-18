// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// import '../../constants.dart';

// class MapWidget extends StatelessWidget {
//   final Completer<GoogleMapController> _controller = Completer();

//   final LocationData currentLocation;
//   final List<LatLng> polylineCoordinates;
//   final LatLng destinationLocation;

//   MapWidget({
//     required this.currentLocation,
//     required this.polylineCoordinates,
//     required this.destinationLocation,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//         initialCameraPosition: CameraPosition(
//             target:
//                 LatLng(currentLocation.latitude!, currentLocation.longitude!),
//             zoom: 14.5),
//         polylines: {
//           Polyline(
//             polylineId: const PolylineId("route"),
//             points: polylineCoordinates,
//             color: appPrimaryColor,
//             width: 5,
//           )
//         },
//         markers: {
//           Marker(
//             draggable: true,
//             markerId: const MarkerId("Current Location"),
//             position:
//                 LatLng(currentLocation.latitude!, currentLocation.longitude!),
//             icon:
//                 BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//           ),
//           Marker(
//             draggable: true,
//             markerId: const MarkerId("Current Location"),
//             position: destinationLocation,
//             icon:
//                 BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           )
//         },
//         onMapCreated: (mapController) {
//           _controller.complete(mapController);
//         });
//   }
// }
