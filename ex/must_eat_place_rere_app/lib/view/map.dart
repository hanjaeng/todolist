import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:latlong2/latlong.dart'; //import 해오고 latlng로 명명

class Map2 extends StatefulWidget {
  const Map2({super.key});

  @override
  State<Map2> createState() => _Map2State();
}

class _Map2State extends State<Map2> {
  late double latData;
  late double longData;
  late MapController mapController;

  var Data = Get.arguments ?? '__';

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    latData = Data[0];
    longData = Data[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            title: Text('지도')),
        body: flutterMap() //true면 flutterMap으로 보낼꺼얌
        );
  }

  //--Widgets--
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          initialCenter: latlng.LatLng(latData, longData), initialZoom: 17.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(markers: [
          Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(latData, longData), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      Data[2],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.pin_drop,
                    size: 50,
                    color: Colors.red,
                  )
                ],
              ))
        ]),
      ],
    );
  }
}
