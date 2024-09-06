import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:must_eat_place_rere_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
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
  static const seedColor = Color.fromARGB(255, 116, 144, 255);  // seed칼라 만들기
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: Home(onchageTheme: _changeThemeMode),
    );
  }
}
