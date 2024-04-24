

// import 'package:flutter/material.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// LatLng currentPosition = LatLng(34.006960, 71.533060);

// class Google_Map extends StatefulWidget {
//   const Google_Map({super.key});

//   @override
//   State<Google_Map> createState() => _Google_MapState();
// }

// class _Google_MapState extends State<Google_Map> {
//   late GoogleMapController mapController;
//   final List<Marker> _markers = [];

//   final List<Marker> _list = const [
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(34.006960, 71.533060),
//         infoWindow: InfoWindow(title: "I am marker 1")),
//     Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(34.006960, 71.553060),
//         infoWindow: InfoWindow(title: "I am marker 2")),
//     Marker(
//         markerId: MarkerId('3'),
//         position: LatLng(34.006960, 71.513060),
//         infoWindow: InfoWindow(title: "I am marker 3"))
//   ];
//   @override
//   void initState() {
//     _markers.addAll(_list);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Google Map'),
//           backgroundColor: Colors.blue,
//         ),
//         body: GoogleMap(
//           onMapCreated: ((controller) {
//             mapController = controller;
//           }),
//           //_onMapCreated,
//           initialCameraPosition:
//               CameraPosition(target: currentPosition, zoom: 14.0),
//           markers: Set.of(_markers),
//           myLocationEnabled: true,

//           mapType: MapType.normal,
//         ));
//   }
// }
