import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(-0.142565, 35.946346);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 14.5),
    );
  }
}
