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
    0: const SizedBox(
      child: Text(
        '현위치',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    1: const SizedBox(
      child: Text(
        '둘리뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    2: const SizedBox(
      child: Text(
        '서대문형무소역사관',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    kindChoice = 0;
    mapController = MapController();
    canRun = false; //가만히 있어라
    location = ['현재 위치', '둘리뮤지엄', '서대문 형무소 역사관'];
    checkLocationPermission();
  }

  checkLocationPermission() async {
    //기다려!! await쓰려고 async씀(사용자가 권한 선택 전까지 대기!)
    LocationPermission permission = await Geolocator.checkPermission();
    //거부시
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    //사용하는동한 항상 허용
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
          toolbarHeight: 100,
          title: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('GPS & Map'),
                ),
                CupertinoSegmentedControl(
                  groupValue: kindChoice,
                  children: segmentWidgets, //3개 넣을예정! 위젯으로
                  onValueChanged: (value) {
                    kindChoice = value;
                    if (kindChoice == 0) {
                      getCurrentLocation();
                      latData = currentPosion.latitude;
                      longData = currentPosion.longitude;
                      mapController.move(
                        latlng.LatLng(latData, longData),
                        17.0, //zoomm
                      );
                    } else if (kindChoice == 1) {
                      latData = 37.65243153;
                      longData = 127.0276397;
                      mapController.move(
                        latlng.LatLng(latData, longData),
                        17.0,
                      );
                    } else {
                      latData = 37.57244171;
                      longData = 126.9595412;
                      mapController.move(
                        latlng.LatLng(latData, longData),
                        17.0,
                      );
                    }
                    setState(() {});
                  },
                ),
              ],
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
          initialCenter: latlng.LatLng(latData, longData), initialZoom: 17.0),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80,
              height: 80,
              point: latlng.LatLng(latData, longData), //center위치에 마커가 있음
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      location[kindChoice],
                      style:TextStyle(
                        fontSize: 10,
                        fontWeight:FontWeight.bold,
                        color: Colors.black
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
