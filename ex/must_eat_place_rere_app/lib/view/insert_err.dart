import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/restaurant.dart';
import '../vm/database_handler.dart';

class InsertRestaurant extends StatefulWidget {
  const InsertRestaurant({super.key});

  @override
  State<InsertRestaurant> createState() => _InsertRestaurantState();
}

class _InsertRestaurantState extends State<InsertRestaurant> {
  late DatabaseHandler handler;
  late TextEditingController latitudeController;
  late TextEditingController longitudeController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController memoController;
  late TextEditingController locateController;

  // late Position currentPosion;
  // late double latData;
  // late double longData;
  // late MapController mapController;
  // late bool canRun;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    memoController = TextEditingController();
    // mapController = MapController();
    // canRun = false; //가만히 있어라

    
    // latData = 0.0;
    // longData = 0.0;
    // checkLocationPermission();
  }

  // checkLocationPermission() async {
    //기다려!! await쓰려고 async씀(사용자가 권한 선택 전까지 대기!)
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   //거부시
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return;
  //   }
  //   //사용하는동한 항상 허용
  //   if (permission == LocationPermission.whileInUse ||
  //       permission == LocationPermission.always) {
  //     getCurrentLocation();
  //   }
  // }

  // getCurrentLocation() async {
  //   //학원위치 위도(Latitude) : 37.4973294 / 경도(Longitude) : 127.0293198
  //   Position position = await Geolocator.getCurrentPosition();
  //   currentPosion = position;
  //   canRun = true;
  //   latData = currentPosion.latitude;
  //   longData = currentPosion.longitude;
  //   setState(() {});
  // }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // 권한이 영구적으로 거부된 경우 처리
//     return;
//   }
  
//   // 현재 위치 가져오기
//   Position position = await Geolocator.getCurrentPosition();
//   print('Current position: ${position.latitude}, ${position.longitude}');
// }

// checkLocationPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }
//     if (permission == LocationPermission.whileInUse ||
//         permission == LocationPermission.always) {
//       getCurrentLocation();
//     }
//   }

//   getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition();
//       setState(() {
//         currentPosition = position;
//         latData = position.latitude;
//         longData = position.longitude;
//         latitudeController.text = latData.toString();
//         longitudeController.text = longData.toString();
//         canRun = true;
//       });
//     } catch (e) {
//       print('Error getting location: $e');
//     }
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맛집추가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {
                  getImageFromGally(ImageSource.gallery);
                },
                child: Text('image')),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: imageFile != null
                  ? Image.file(File(imageFile!.path))
                  : Center(child: Text('No Image Selected')),
            ),


            Row(children: [
              // Text('위치: ${latData} / ${longData}'),
              Container(
                width: 100,
              child: TextField(
                controller: latitudeController,
                // keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              ),
              Container(
                width: 100,
              child: TextField(
                controller: longitudeController,
                // keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),)
            ]),
            Row(
              children: [
                Text('이름: '),
                Container(
                  width: 200,
                  child: TextField(controller: nameController),
                ),
              ],
            ),
            Row(
              children: [
                Text('전화: '),
                Container(
                  width: 200,
                  child: TextField(controller: phoneController),
                ),
              ],
            ),
            Row(
              children: [
                Text('평가: '),
                Container(
                  width: 200,
                  child: TextField(controller: memoController),
                ),
              ],
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black, // 배경색 지정
                    foregroundColor: Colors.white),
                onPressed: () => insertAction(),
                child: Text('입력')),
          ],
        ),
      ),
    );
  }

  //fuciton
  Future getImageFromGally(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      return;
    } else {
      imageFile = XFile(pickedFile.path);
      setState(() {});
    }
  }

  Future insertAction() async {
    File imageFile1 = File(imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    var restaurantInsert = Restaurant(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        locate: locateController.text.trim(),
        latitude: double.parse(latitudeController.text.trim()),
        longitude: double.parse(longitudeController.text.trim()),
        memo: memoController.text.trim(),
        img: getImage);

    int result = await handler.InsertRestaurant(restaurantInsert);
    if (result != 0) {
      _showDialog();
    }
  }

  _showDialog() {
    Get.defaultDialog(
        title: '입력 결과',
        middleText: '입력이 완료되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('확인'),
          )
        ]);
  }
}
