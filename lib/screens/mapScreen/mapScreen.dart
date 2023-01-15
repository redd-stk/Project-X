import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../extra components/gMaps.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng mySourceLocation = LatLng(-0.142565, 35.946346);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gMap(mySourceLocation),
    );
  }
}
