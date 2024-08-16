import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//property
  late String _lampImage; //img File Name
  late double _lampWidth; //img width
  late double _lampHeight; //img Height
  late String _buttonName; //ButtinTitle
  late bool _switch; //Switch 켜짐 상태
  late bool _lampSizeStatus; //현재 Lamp크기
  late double _lampAngle; //Lamp 회전 각도

  // late double _lampRotate; // 회전
  // late String _rotateButtonName;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "image 확대";
    _switch = true;
    _lampSizeStatus = false;
    _lampAngle = 0;

    // _lampRotate = 0;
    // _rotateButtonName = "image 회전";

    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   rotateImageOn();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image확대 및 축소'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                //padding
                width: 330,
                height: 630,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_lampAngle / 360),
                      child: Image.asset(
                        _lampImage,
                        width: _lampWidth,
                        height: _lampHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => decisionLampSize(),
                    child: Text(_buttonName),
                  ),
                  // TextButton(
                  //   onPressed: () => rotateImageOn(),
                  //   child: Text(_rotateButtonName),
                  // ),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(fontSize: 10),
                      ),
                      Switch(
                        value: _switch, // 화면 --> 사용자가 움직이면 value
                        onChanged: (value) {
                          //움직임 true false를 value가 알고 있음
                          _switch = value;
                          decisionOnOff();
                        },
                      ),
                    ],
                  )
                ],
              ),
              Container(
                color: Colors.amber,
                width: 200,
                child: Slider(               //슬라이더
                  value: _lampAngle,
                  min:0,
                  max: 360,
                  onChanged:(value){
                    _lampAngle = value;
                    setState((){});          
                  }
                ),
              )
            ],
          ),
        ));
  }

  // ----Functions----
  decisionOnOff() {
    if (_switch) {
      //switch true면 lampimge
      _lampImage = "images/lamp_on.png";
    } else {
      _lampImage = "images/lamp_off.png";
    }
    setState(() {});
  }

  decisionLampSize() {
    if (_lampSizeStatus) {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = false;
    } else {
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = 'Image 축소';
      _lampSizeStatus = true;
    }
    setState(() {});
  }

  // rotateImageOn() {
  //   // _lampRotate += 5;
  //   // setState((){});
  //   if (_rotateButtonName == 'image 회전') {
  //       RotationTransition(turns: ,)
  //     _rotateButtonName = 'image 멈춤';
  //     _lampRotate += 5;
  //   }
  //   setState(() {});
  // }

  // rotateImageOff() {
  //   if (_rotateButtonName == 'image 멈춤') {
  //     _rotateButtonName = 'image 회전';
  //     _lampRotate += 0;
  //   }
  //   setState(() {});
    // if(_lampRotate == 1){
    //   _lampRotate += 1;
    //   _rotateButtonName = 'image 회전';
    // }else{
    //   _lampRotate += 1;
    //   _rotateButtonName = 'image 멈춤';
    // }
  // }
} // End
