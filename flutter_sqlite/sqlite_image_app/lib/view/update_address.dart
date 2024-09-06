import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqlite_image_app/model/address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
 //property
  late DatabaseHandler handler;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController relationController;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  late int firstDisp;
  var value = Get.arguments ?? "__";

  @override
  void initState() {
    super.initState();
    handler =DatabaseHandler();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    relationController = TextEditingController();

    firstDisp = 0;   //0일때와 0 아닐때 업데이트 문장 틀리게

    nameController.text = value[1];
    phoneController.text = value[2];
    addressController.text = value[3];
    relationController.text = value[4];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록 수정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: '이름을 입력 하세요'
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: '연락처를 입력 하세요'
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: '주소를 입력 하세요'
                  ),
                ),
                TextField(
                  controller: relationController,
                  decoration: InputDecoration(
                    labelText: '관계를 입력 하세요'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      getImageFromGally(ImageSource.gallery);
                  
                    }, 
                    child: Text('Gallery'),
                  ),
                ),
                firstDisp ==0
                ? Container(   //보여주는 콘테이너(첫화면)(처음생성)
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Image.memory(value[5])
                  )
                )
                : Container(   //선택할때 보여주는 컨테이너(벝튼 누르면 1)
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: imageFile == null
                    ? const Text('image is no selected.')
                    : Image.file(File(imageFile!.path)),   //image.file로
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      if(firstDisp ==0) {
                        updateAction()           ///////////////////////////////?
                      }else{
                      updateActionAll()}
                    }
                    , 
                    child: Text('수정')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //fuciton
  Future getImageFromGally(ImageSource ImageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: ImageSource);
    if(pickedFile == null){
      return;
    } else{
      imageFile= XFile(pickedFile.path);
      setState(() {   });
    }
  }
  Future updateActionAll()async{
    //file type을 byte type으로 변환하기
    File imageFile1 = File(imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    var addressUpdate = Address(
      id: value[0],
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      relation: relationController.text.trim(),
      image: getImage);
    
    int result = await handler.updateAddressAll(addressUpdate);  
    if (result != 0) {
      _showDialog();
      
      }
    }


  Future updateAction()async{
    var addressUpdate = Address(
      id: value[0],
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      relation: relationController.text.trim(),
      image: value[5]);
    
    int result = await handler.updateAddress(addressUpdate);  
    if (result != 0) {
      _showDialog();
      }
    }


  _showDialog(){
        Get.defaultDialog(
          title: '수정 결과',
          middleText: '수정이 완료되었습니다.',
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          barrierDismissible: false,
          actions: [
            TextButton(
              onPressed: (){
                Get.back();
                Get.back();
              },
              child: const Text('asdf'),
            )] 
    );
  }
}