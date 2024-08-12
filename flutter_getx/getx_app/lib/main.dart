import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart'; 
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(               //필수!! GetMaterialApp으로!!!
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),  //기본색
        useMaterial3: true,            //색감편하게
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name:  '/second',
          page: () => const SecondPage(),
          transition: Transition.circularReveal,   //애플 안드로이드 화면이동 방향 모양 같아짐!! 
          transitionDuration: const Duration(seconds: 3),
        ),
      ],
    );
  }
}
