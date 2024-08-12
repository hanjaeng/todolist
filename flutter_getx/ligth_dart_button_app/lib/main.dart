import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {    // 전구굴러 st fulㄹㅎ로
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;      //모드

  _changeThemeMode(ThemeMode themeMode){       //함수생성
    _themeMode = themeMode;
    setState(() {});
  }

  static const seedColor = Colors.deepPurple;  // seed칼라 만들기

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3:true,
        colorSchemeSeed: seedColor,
      ),


      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: seedColor
      ),
      home: Home(onchageTheme: _changeThemeMode),   //home에서 onchangTheme와 연결!!!
    );
  }
}
