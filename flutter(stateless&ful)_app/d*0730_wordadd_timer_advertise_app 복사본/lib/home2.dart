import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
//per
  late List str;
  late int currentCharater;
  late String character;

  @override
  void initState() {
    super.initState();
    String data = '대한민국';

    str = data.split('');
    // data 문자열을 분할하여 str 에 저장한다. 분할하는 기준은 split 함수의 첫 번째 인자이다.
    // split('') 는 빈 문자열 기준으로 분할하는 것이며, 결과는 '대', '한', '민', '국' 의 List<String> 이
    // 리턴된다. 
    // 참조: https://api.flutter.dev/flutter/dart-core/String/split.html
    currentCharater = 0;      
    character = str[currentCharater];
    // character 에 str 의 첫 번째 아이템 설정, 즉, '대' 가 character 에 설정된다.

    Timer.periodic(   // Timer 설치
      const Duration(seconds: 1),
      (time) => changeCharacter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body:Center(
    child: Text(
      character,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
  )
    );
  }
  
  //---function---
  changeCharacter(){
    currentCharater++;
    if (currentCharater >= str.length){
      currentCharater = 0;          
    // currentCharacter 의 크기가 str.length (== 4) 보다 큰 경우 0 으로 설정한다.
    // chageCharacter 함수가 호출될 때마다,
    // currentCharacter 는 0, 1, 2, 3, 0, 1, 2, 3 의 숫자가 반복적으로 설정되는 것이다.
      character = str[currentCharater];  // character 에 '대' 를 설정한다.
    } else{
      character += str[currentCharater];
    }   // character 에 str[currentCharacter] ('한', '민', '국' 이 순서대로) 를 추가한다.
        // initState 첫 실행시
        // character 의 값은 '대' 이며, chageCharacter 가 호출될 때마다
        // character == '대한'
        // character == '대한민'
        // character == '대한민국'
        // character == '대'
        // 가 되는 것이다.
    
    setState((){});
    }
  }