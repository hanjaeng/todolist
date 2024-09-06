import 'dart:async';

import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {

//property
  late String _lampImage; //img File Name
  late double _lampWidth; //img width
  late double _lampHeight; //img Height
  late bool _lampSizeStatus; //현재 Lamp크기
  late bool _switchSize;
  late bool _switchOnOFF; //Switch 켜짐 상태
  late bool _switchColor;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switchOnOFF = true;
    _switchSize = true;
    _lampSizeStatus = true;
    _switchColor = true;
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
            SizedBox(      //padding
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        '전구 색깔',
                        style: TextStyle(fontSize: 15),
                      ),
                      Switch(
                        value: _switchColor,   
                        onChanged: (value){ 
                          _switchColor = value;
                          decisionLampColor();
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        '전구 확대',
                        style: TextStyle(fontSize: 15),
                      ),
                      Switch(
                        value: _switchSize,   
                        onChanged: (value){ 
                          _switchSize = value;
                          decisionLampSize();
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(fontSize: 15),
                      ),
                      Switch(
                        value: _switchOnOFF,   // 화면 --> 사용자가 움직이면 value
                        onChanged: (value){ //움직임 true false를 value가 알고 있음
                          _switchOnOFF = value;
                          decisionOnOff();
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }

  // ----Functions----
  decisionOnOff(){
    if(_switchOnOFF){  //switch true면 lampimge 
      _lampImage = "images/lamp_on.png";
    }else{
      _lampImage = "images/lamp_off.png";
    }
    setState((){});
  }

  decisionLampSize(){
    if(_lampSizeStatus){
      _lampWidth = 150;
      _lampHeight = 300;
      _lampSizeStatus = false;
    }else{
      _lampWidth = 300;
      _lampHeight = 600;
      _lampSizeStatus = true;
    }
  setState((){});
  }

  decisionLampColor(){
    if(_switchOnOFF){
      _lampImage = "images/lamp_on.png";
      if(_switchColor){
        _lampImage = "images/lamp_on.png";
      }else{
        _lampImage = "images/lamp_red.png";
      }
    }
    setState((){});
  }
}// End