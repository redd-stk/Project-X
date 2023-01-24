import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late GoogleMapController mapController;
  Position? currentLocation;
  Position? destinationLocation;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps')),
      body: (currentLocation == null)
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              markers: markers,
              polylines: polylines,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude,
                  currentLocation!.longitude,
                ),
                zoom: 17.0,
              ),
              onMapCreated: _onMapCreated,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _updateDestinationLocation();
          if (destinationLocation != null) {
            _addPolyline();
            _addMarker(
                LatLng(destinationLocation!.latitude,
                    destinationLocation!.longitude),
                'Destination',
                BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue));
          }
        },
        child: Icon(Icons.navigation),
      ),
    );
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = position;
      _addMarker(
          LatLng(currentLocation!.latitude, currentLocation!.longitude),
          'Current Location',
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    });
  }

  _updateDestinationLocation() async {
    Position? position = await Geolocator.getLastKnownPosition(
        // desiredAccuracy: LocationAccuracy.high
        );
    setState(() {
      destinationLocation = position!;
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  _addMarker(LatLng position, String title, BitmapDescriptor descriptor) {
    Marker marker = Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      infoWindow: InfoWindow(title: title),
      icon: descriptor,
    );
    setState(() {
      markers.add(marker);
    });
  }

  _addPolyline() {
    Polyline polyline = Polyline(
      polylineId: const PolylineId('poly'),
      color: Colors.blue,
      points: [
        LatLng(currentLocation!.latitude, currentLocation!.longitude),
        LatLng(destinationLocation!.latitude, destinationLocation!.longitude),
      ],
    );
    setState(() {
      polylines.add(polyline);
    });
  }
}
