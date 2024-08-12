import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ProPerty
  late List str;         //body글자 리스트.. 
  late int currentText;  //body글자 광고 띄울 글자..
  late String viewText;  //body글자 함수..
  late TextEditingController inputText;  //draw에 입력할 광고문
  late bool _switchHeart; //하트 스위치
  late bool _switchStar;  //별 스위치
  late int heart; //하트 입력
  late int star;  //별 입력

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String data = '광고입력자리';   //body  초기화면글자..
    str = data.split('');        //body  글사생성함수..
    currentText = 0;              //body 글자생성함수..
    viewText = str[currentText];  //body 글자생성함수..
    inputText = TextEditingController();
    _switchHeart = false; //하트 스위치
    _switchStar = false; //별 스위치
    heart = 0;
    star = 0;

    Timer.periodic(            //body 광고 글자 생성 타이머
      Duration(seconds: 1),
      (time) => changeTexter(),   
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          viewText,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(               //draw 창
            accountName: Text('광고문구를 입력하세요'),  
            accountEmail: Text(''),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(),
            ),
          ),

          TextField(                            //body 광고 문구 입력 박스
            controller: inputText,
            decoration: InputDecoration(labelText: '문구를 입력하세요'),
            keyboardType: TextInputType.text,
          ),
          ElevatedButton(onPressed: () => bodyText, child: Text('입력')),  // 입력버튼
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.heart_broken_sharp),  //하트스위치
                Switch(
                    value: _switchHeart,
                    onChanged: (value) {
                      _switchHeart = value;
                      drawHeart();
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),        
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.star),         //별스위치
              Switch(
                value: _switchStar,
                onChanged: (value) {
                  _switchStar = value;
                  drawStar();
                },
              )
            ]),
          )
        ],
      )),
    );
  }

  // --fuction--
  bodyText(context) {
    Navigator.pop(context);
  }

  changeTexter() {      // body 광고 글자 한글자씩 생성
    currentText++;
    if (currentText >= str.length) {
      currentText = 0;
      viewText = str[currentText];
    } else {
      viewText += str[currentText];
    }
    setState(() {});
  }



  drawHeart() {
  if(_switchHeart){
    
  }
  }

  drawStar() {}

}