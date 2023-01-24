import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen8 extends StatefulWidget {
  const MapScreen8({super.key});

  @override
  _MapScreen8State createState() => _MapScreen8State();
}

class _MapScreen8State extends State<MapScreen8> {
  late GoogleMapController _controller;
  Position? _currentPosition;
  String _destination = '';
  late BitmapDescriptor _currentLocationIcon;
  late BitmapDescriptor _destinationIcon;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _createMarkerIcons();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _markers.add(Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(position.latitude, position.longitude),
        icon: _currentLocationIcon,
      ));
    });
  }

  void _createMarkerIcons() async {
    _currentLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/current_location.png');
    _destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), 'assets/destination.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onDestinationChanged(String value) {
    setState(() {
      _destination = value;
      _markers.add(Marker(
        markerId: const MarkerId('destination'),
        position: const LatLng(
            40.748817, -73.985428), // Example destination coordinates
        icon: _destinationIcon,
      ));
      _polylines.add(Polyline(
        polylineId: const PolylineId('route'),
        points: [
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          const LatLng(
              40.748817, -73.985428), // Example destination coordinates
        ],
        color: Colors.blue,
        width: 4,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 8),
                  Text('Loading'),
                ],
              ),
            )
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
                zoom: 14.0,
              ),
              markers: _markers,
              polylines: _polylines,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Enter Destination'),
                content: TextFormField(
                  onChanged: _onDestinationChanged,
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add_location),
      ),
    );
  }
}
