import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  LocationData? _locationData;
  final Location _locationService = Location();
  late GoogleMapController mapController;
  List<Marker> markers = [];
  late LatLng pinPosition;
  final Set<Marker> _markers = {};
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _locationData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Text("Loading..."),
                ],
              ),
            )
          : Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _locationData!.latitude!,
                      _locationData!.longitude!,
                    ),
                    zoom: 16.0,
                  ),
                  myLocationEnabled: true,
                ),
                Positioned(
                  top: 50.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ],
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: destinationController,
                      decoration: InputDecoration(
                        icon: Container(
                          margin: const EdgeInsets.only(left: 20, top: 5),
                          width: 10,
                          height: 10,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                        ),
                        hintText: "Choose Destination",
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 15.0, top: 16.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: _onAddMarkerPressed,
                    tooltip: "add destination",
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.pin_drop),
                  ),
                ),
              ],
            ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        infoWindow: const InfoWindow(title: 'Your Location', snippet: '*'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
  }

  _onAddMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('destLocation'),
        position: pinPosition,
        infoWindow: InfoWindow(title: destinationController.text, snippet: '*'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var location = await _locationService.getLocation();
    setState(() {
      _locationData = location;
    });
  }
}
