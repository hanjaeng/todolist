import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:latlong2/latlong.dart'; //import 해오고 latlng로 명명

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late Position currentPosion;
  late int kindChoice;
  late double latData;
  late double longData;
  late MapController mapController;
  late bool canRun;
  late List location;

  // Segment Widget
  Map<int, Widget> segmentWidgets = {
    0: const SizedBox(),
    1: const SizedBox(),
    2: const SizedBox(),
    3: const SizedBox(),

  };

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false; //가만히 있어라
    location = ['혜화문', '흥인지문', '창의문', '숙정문'];
    checkLocationPermission();
  }

  checkLocationPermission() async {
    //기다려!! await쓰려고 async씀
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    //학원위치 위도(Latitude) : 37.4973294 / 경도(Longitude) : 127.0293198
    Position position = await Geolocator.getCurrentPosition();
    currentPosion = position;
    canRun = true;
    latData = currentPosion.latitude;
    longData = currentPosion.longitude;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Column(
            ),
          ),
        ),
        body: canRun //canRun이..
            ? flutterMap() //true면 flutterMap으로 보낼꺼얌
            : const Center(
                //false면 원형 로딩화면.. true될때까지...
                child: CircularProgressIndicator(),
              ));
  }

  //--Widgets--
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          initialCenter: latlng.LatLng(latData, longData), initialZoom: 13.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5878892, 127.003798), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text('혜화문',
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight:FontWeight.bold,
                        color: Colors.purple
                      )
                      )
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color:Colors.purple,
                  )
                ],
              ) 
            ) 
          ]
        ),

        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5711907, 127.009506), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text('흥인지문',
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight:FontWeight.bold,
                        color: Colors.grey
                      )
                      )
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color:Colors.grey,
                  )
                ],
              ) 
            ) 
          ]
        ),

        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.592627, 126.9664771), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text('창의문',
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight:FontWeight.bold,
                        color: Colors.brown
                      )
                      )
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color:Colors.brown,
                  )
                ],
              ) 
            ) 
          ]
        ),

        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(37.5956584, 126.9810576), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text('숙정문',
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight:FontWeight.bold,
                        color: Colors.red
                      )
                      )
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 50,
                    color:Colors.red,
                  )
                ],
              ) 
            ) 
          ]
        ),


      ],
    );
  }
}
