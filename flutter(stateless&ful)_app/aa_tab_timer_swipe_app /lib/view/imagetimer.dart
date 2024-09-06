import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class imageTimer extends StatefulWidget {
  const imageTimer({super.key});

  @override
  State<imageTimer> createState() => _HomeState();
}

class _HomeState extends State<imageTimer> {
  late List<String> imageFile;
  late int currentPage;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    imageFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentPage = 0;

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {if(isRunningOnPlatformThread){
        timer.cancel();
      }
        changeImage();
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFile[currentPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset(
              'images/${(imageFile[currentPage])}',
              width: 400,
            ),

            // ElevatedButton(
            //   onPressed: () => changeImage(),
            //   child: const Text('Test'))
          ],
        ),
      ),
    );
  }

  changeImage() {
    currentPage++;
    if (currentPage >= imageFile.length) {
      currentPage = 0;
    }

    setState(() {});
  }
}
