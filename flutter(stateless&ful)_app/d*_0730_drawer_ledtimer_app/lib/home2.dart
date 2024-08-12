import 'dart:async';

import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  late TextEditingController advertisementController;
  late String currentText; // 현재 문구
  late int currentIndex; // 현재 문구 index
  late List<String> advTextList; // 전체 문구 char리스트
  late bool starSwitch;
  late bool heartSwitch;
  late String specialChar;  // 특수문자 타입
  late String topText;  // 상단 텍스트
  late String bottomText; // 하단 텍스트

  late bool textState; // 문구 출력여부

  late List<double> bottomPos;
  late int bottomPosIndex;

  @override
  void initState() {
    super.initState();

    advertisementController = TextEditingController();
    advTextList = advertisementController.text.split('');

    currentIndex = 0;
    currentText = '';

    textState = false;

    starSwitch = false;
    heartSwitch = false;
    specialChar = '';
    topText = '';
    bottomText = '';
    bottomPos = [0, 100, 200, 300];
    bottomPosIndex = 0;

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => textUpdate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  '광고 문구를 입력하세요.',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                  child: TextField(
                    controller: advertisementController,
                    decoration: const InputDecoration(
                      labelText: '글자를 입력하세요',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                  child: ElevatedButton(
                    onPressed: () => updateAdvertisement(),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      '광고문구 생성',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                  child: ElevatedButton(
                    onPressed: () => deleteAdvertisement(),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      '광고문구 제거',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '★',
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                      value: starSwitch,
                      onChanged: (value) {
                        starSwitch = value;
                        specialOnOff();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '♥',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Switch(
                      value: heartSwitch,
                      onChanged: (value) {
                        heartSwitch = value;
                        specialOnOff();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  topText,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              currentText,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Stack(
            children:[
              const SizedBox(
                width: 300,
                height: 100,
              ),
              Positioned(
                left: bottomPos[bottomPosIndex],
                child: Text(
                  bottomText,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ]
          ),
          ],
        ),
      ),
    );
  }

  textUpdate() {
    if(textState){
      if (advTextList.isNotEmpty) {
        if (currentIndex >= advTextList.length) {
          currentIndex = 0;
          currentText = advTextList[currentIndex];
        } else {
          currentText += advTextList[currentIndex];
        }
      }
      if(topText.length < 19){ // 상단바 업데이트
        topText += specialChar;
      }
      bottomPosIndex++;
      if(bottomPosIndex >= bottomPos.length){
        bottomPosIndex = 0;
      }
    }
    currentIndex++;
    setState(() {});
  }

  updateAdvertisement() {
    
    if(advertisementController.text.isNotEmpty){
      advTextList = advertisementController.text.split('');
      advertisementController.text = '';
      currentText = '';
      currentIndex = 0;
      topText = '';
      bottomPosIndex = 0;
      bottomText = specialChar;
      textState = true;
      Navigator.pop(context);
    }
    else{
      errorSnackBar();
    }
    setState(() {});
  }

  deleteAdvertisement() {
    Navigator.pop(context);
    advTextList = advertisementController.text.split('');
    advertisementController.text = '';
    currentText = '';
    currentIndex = 0;
    topText = '';
    bottomPosIndex = 0;
    bottomText = '';
    textState = false;

    setState(() {});
  }

  specialOnOff() {
    specialCheck();
    if (starSwitch) {
      specialChar = '★';
    } else if (heartSwitch) {
      specialChar = '♥';
    } else {
      specialChar = '';
      topText = '';
    }
    setState(() {});
  }

  specialCheck() {
    if (starSwitch) {
      heartSwitch = false;
    } else if (heartSwitch) {
      starSwitch = false;
    }
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력 하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
}
