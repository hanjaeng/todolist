import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  XFile? imageFile;  //asset에서 불러오는게 아니라 폰 갤러리 사진에서 불러올때!!!!(file 로되어 있음)
  // ? 는 null데이터도 갖고 올 수 있음
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('galler & camera'),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => getImageFromDevice(ImageSource.gallery),  //gallery에서 이미지 가져옴
                    child: Text('gallery'),
                  ),
                  ElevatedButton(
                    onPressed: ( ) => getImageFromDevice(ImageSource.camera),
                    child: Text('camera'),
                  ),
                ],
              )
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,  //사이즈 폭 가져옴(폰마다크기다르므로) 비율적용하기 위해
              height: 200,
              child: Center(
                child: imageFile == null
                ? const Text("image is not selected.")
                : Image.file(File(imageFile!.path)), //imgefile이 ?타입이므로 !로 
              ),
            )

          ],
        )
      )
    );
  }
  // -function
  getImageFromDevice(imageSource) async{ //사진앱에서 가져와야 하므로..async기다려!!
    final XFile? pickedFile = await picker.pickImage(source: imageSource); //pick한 이미지 가져옴
    if(pickedFile == null) {  //선택 안했을때
      imageFile = null;
    } else {
      imageFile = XFile(pickedFile.path);
    }
    setState(() {});
    }
  }
