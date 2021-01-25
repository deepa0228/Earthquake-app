import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController mapController;
  static LatLng _center = const LatLng(45.521563,-122.677433);
  static LatLng anotherLocation = const LatLng(45.509244,-122.633476);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: GoogleMap(
        markers: {portlandMarker,portlandMarkerSecond},
        mapType: MapType.hybrid,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom:11)),
      floatingActionButton: FloatingActionButton.extended(onPressed: _goToIntel, 
      label: Text("intel"),
      icon: Icon(Icons.place),
      ),  
    );
  }
  static final CameraPosition intelPosition = CameraPosition(target: LatLng(45.5418295,-122.9170456),
  zoom: 14.780,
  bearing: 191.789,
  tilt: 34.89,
  );
  
  Future<void> _goToIntel() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker portlandMarker = Marker(markerId: MarkerId("Portland"),
  position: _center,
  infoWindow: InfoWindow(title: "Portland",snippet: "This is a great Towm😃"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );

  Marker portlandMarkerSecond = Marker(markerId: MarkerId("Portland"),
  position: anotherLocation,
  infoWindow: InfoWindow(title: "Portland area",snippet: "😃"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );
}