import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';


GoogleMap gMap(sourceLocation) {
    final Completer<GoogleMapController> _controller = Completer();
    return GoogleMap(
    initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 15),
    markers: {
      Marker(
        draggable: true,
        markerId: const MarkerId("Current Location"),
        position: sourceLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      )
    },
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
  );
}
