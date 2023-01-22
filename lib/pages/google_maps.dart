import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController googleMapController;
  late List<Marker> markers = [];
  bool showMap = true;

  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId(title),
        position: const LatLng(37.42796133580664, -122.085749655962),
      ),
    );

    if (markers.isNotEmpty) {
      setState(() => showMap = true);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 300,
        width: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GoogleMap(
          onMapCreated: (controller) => setState(
            () => googleMapController = controller,
          ),
          markers: Set<Marker>.of(markers),
          mapType: MapType.terrain,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 15,
          ),
        ),
      ),
    );
  }
}
