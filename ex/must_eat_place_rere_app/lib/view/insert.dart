import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart'; // Geolocator 패키지 추가

import '../../model/restaurant.dart';
import '../../vm/database_handler.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late DatabaseHandler handler;
  late TextEditingController nameController;
  late TextEditingController locateController;
  late TextEditingController phoneController;
  late TextEditingController memoController;

  double? _latitude;
  double? _longitude;
  String _errorMessage = "";

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    nameController = TextEditingController();
    locateController = TextEditingController(); 
    phoneController = TextEditingController();
    memoController = TextEditingController();
    _getCurrentLocation(); // 위치 정보를 가져오는 메서드 호출
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화 되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _errorMessage = '위치 서비스가 비활성화되어 있습니다.';
      });
      return;
    }

    // 위치 권한이 허용되어 있는지 확인
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        setState(() {
          _errorMessage = '위치 권한이 거부되었습니다.';
        });
        return;
      }
    }

    // 현재 위치 가져오기
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _errorMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맛집추가'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white
                      ),
                  onPressed: () {
                    getImageFromGally(ImageSource.gallery);
                  },
                  child: Text('image ')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: imageFile != null
                      ? Image.file(File(imageFile!.path))
                      : Center(child: Text('No Image Selected')),
                ),
              ),
              // 위도와 경도를 표시하는 부분
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _errorMessage.isNotEmpty
                          ? Text(
                              _errorMessage,
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '위도  ${_latitude?.toString() ?? '위치를 가져오는 중...'}'),
                                Text('  |'),
                                Text(
                                    '  경도  ${_longitude?.toString() ?? '위치를 가져오는 중...'}')
                              ],
                            ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('이  름: '),
                                  Container(
                                    width: 240,
                                    child: TextField(controller: nameController),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('위  치: '),
                                  Container(
                                    width: 240,
                                    child: TextField(controller: locateController),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('전  화: '),
                                  Container(
                                    width: 240,
                                    child: TextField(controller: phoneController),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('한줄평: '),
                                  Container(
                                    width: 240,
                                    child: TextField(controller: memoController),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black, // 배경색 지정
                                        foregroundColor: Colors.white),
                                    onPressed: () => insertAction(),
                                    child: Text('입력')),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        locate: locateController.text.trim(),
        phone: phoneController.text.trim(),
        latitude: _latitude ?? 0.0, // 위치 정보가 없을 경우 기본값 설정
        longitude: _longitude ?? 0.0, // 위치 정보가 없을 경우 기본값 설정
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
