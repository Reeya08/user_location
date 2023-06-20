import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.5889, 71.4429),
    zoom: 10,
  );
  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.5889, 71.4429),
      infoWindow: InfoWindow(
        title: 'My Current Location',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(30.1575, 71.5249),
      infoWindow: InfoWindow(
        title: 'Multan',
      ),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(30.1798, 66.9750),
      infoWindow: InfoWindow(
        title: 'Qoetta',
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          // initial posistion where to start google maps
          onMapCreated: (GoogleMapController controller) {
            // when map created it accepts a controller
            _controller.complete(controller);
          },
          mapType: MapType.normal,
          markers: Set<Marker>.of(_marker),
        ),
      ),
      //to move on a specfic position
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(30.1798, 66.9750),
            zoom: 14,
          )));
          setState(() {});
        },
        child: Icon(Icons.location_disabled_outlined),
      ),
    );
  }
}
