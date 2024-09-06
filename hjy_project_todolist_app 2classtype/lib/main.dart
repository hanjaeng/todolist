import 'package:flutter/material.dart';

import 'view/home.dart';
import 'view/p1_insert.dart';
import 'view/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

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

      routes:{
        // '/':(context) =>  Intro(onchageTheme: _changeThemeMode), //onchageTheme: _changeThemeMode와 연결!!!
        '/':(context) => Home(onchageTheme: _changeThemeMode),
        '/set':(context) => SettingPage(onchageTheme: _changeThemeMode),
        '/insert':(context) => InsertPage(onchageTheme: _changeThemeMode),
      },
      initialRoute: '/',
      
    );
  }
}
