import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/restaurant.dart';
import '../vm/database_handler.dart';

class UpdateRestaurant extends StatefulWidget {
  const UpdateRestaurant({super.key});

  @override
  State<UpdateRestaurant> createState() => _UpdateRestaurantState();
}

// class _UpdateRestaurantState extends State<UpdateRestaurant> {
//   late DatabaseHandler handler;
//   late TextEditingController nameController;
//   late TextEditingController locateController;
//   late TextEditingController phoneController;
//   late TextEditingController memoController;

//   XFile? imageFile;
//   final ImagePicker picker = ImagePicker();

//   late int firstDisp;
//   var value = Get.arguments ?? "__";

//   @override
//   void initState() {
//     super.initState();
//     handler = DatabaseHandler();
//     nameController = TextEditingController();
//     locateController = TextEditingController();
//     phoneController = TextEditingController();
//     memoController = TextEditingController();

    // firstDisp = 0; //0일때와 0 아닐때 업데이트 문장 틀리게

    // nameController.text = value[1];
    // phoneController.text = value[2];
    // locateController.text = value[3];
    // memoController.text = value[6];
//  }

  //---GPT----//
class _UpdateRestaurantState extends State<UpdateRestaurant> {
  late DatabaseHandler handler;
  late TextEditingController nameController;
  late TextEditingController locateController;
  late TextEditingController phoneController;
  late TextEditingController memoController;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  late int seq;
  late String name;
  late String phone;
  late String locate;
  late double latitude;
  late double longitude;
  late String memo;
  late Uint8List img = Uint8List(0);  //-----------수정

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    nameController = TextEditingController();
    locateController = TextEditingController();
    phoneController = TextEditingController();
    memoController = TextEditingController();

    // Get.arguments로부터 전달된 값을 가져옵니다.
    final args = Get.arguments;
print('Arguments: $args');  // Add this line to see the arguments passed
    if (args != null && args.length >= 8) {
      seq = args[0] as int;
      name = args[1] as String;
      phone = args[2] as String;
      locate = args[3] as String;
      latitude = args[4] as double;
      longitude = args[5] as double;
      memo = args[6] as String;
      img = args[7] as Uint8List;

      // 컨트롤러에 초기값 설정
      nameController.text = name;
      phoneController.text = phone;
      locateController.text = locate;
      memoController.text = memo;
    } else {
      // 오류 처리: 인자 배열이 예상보다 짧을 경우
      print('Error: Invalid arguments');
      // 인자 배열의 길이를 체크하고, 화면에 표시할 수 있도록 초기값을 설정할 수 있습니다.
      nameController.text = '';
      phoneController.text = '';
      locateController.text = '';
      memoController.text = '';
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text('맛집수정'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                  child: Text('image ')),
        
              // firstDisp == 0
              //     ? Container(
              //         //보여주는 콘테이너(첫화면)(처음생성)
              //         width: 250,
              //         height: 250,
              //         decoration: BoxDecoration(border: Border.all(width: 2)),
              //         child: Center(child: Image.memory(value[7])))
              //     : Container(
              //         //선택할때 보여주는 컨테이너(벝튼 누르면 1)
              //         width: MediaQuery.of(context).size.width,
              //         height: 250,
              //         child: Center(
              //           child: imageFile == null
              //               ? const Text('image is no selected.')
              //               : Image.file(File(imageFile!.path)), //image.file로
              //         ),
              //       ),
        
        
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Center(
                  child: imageFile == null
                      ? Image.memory(img)
                      : Image.file(File(imageFile!.path)),
                ),
              ),
        
        
              // 위도와 경도를 표시하는 부분
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('위도: ${latitude}'), 
                          Text('  |  '), 
                          Text('경도: ${longitude}')],
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
                                    onPressed: (){
                                      print('Update button pressed'); // 확인용 로그
                                      updateAction();},
                                    child: Text('수정')),
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

  // Future insertAction() async {
  //   File imageFile1 = File(imageFile!.path);
  //   Uint8List getImage = await imageFile1.readAsBytes();
  // }


  //GPT//
  Future<void> updateAction() async {
  // imageFile이 null인 경우 기존 이미지 유지
  Uint8List imageBytes = imageFile != null
      ? await File(imageFile!.path).readAsBytes()
      : img;

  final updatedRestaurant = Restaurant(
    seq: seq,
    name: nameController.text.trim(),
    phone: phoneController.text.trim(),
    locate: locateController.text.trim(),
    latitude: latitude,
    longitude: longitude,
    memo: memoController.text.trim(),
    img: imageBytes,
  );

  int result = await handler.updateCard(updatedRestaurant);
  if (result != 0) {
    _showDialog();
  } else {
    print('Update failed: result is 0');
  }
}

  _showDialog() {
    Get.defaultDialog(
        title: '수정 결과',
        middleText: '수정이 완료되었습니다.',
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
