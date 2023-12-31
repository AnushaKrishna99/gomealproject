import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({super.key});

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static CameraPosition initialPosition = CameraPosition(target: LatLng(37.15478, -122.78945),zoom: 14.0);

  static CameraPosition targetPosition = CameraPosition(target: LatLng(33.15478, -135.78945),zoom: 14.0,bearing: 192.0,tilt: 60);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            goToLake();
          },
          label: Text("to this Lake"),
          icon: Icon(Icons.directions_boat),
      ),
    );
  }
 Future<void> goToLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
