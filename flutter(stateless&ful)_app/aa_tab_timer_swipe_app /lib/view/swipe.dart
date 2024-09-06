import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipe extends StatefulWidget {
  const Swipe({super.key});

  @override
  State<Swipe> createState() => _HomeState();
}

class _HomeState extends State<Swipe> {
  late List<String> imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        child: Center(
          child: Column(
            children: [
              Text(
                imageName[currentImage],
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
              )
            ],
          ),
        ),
      ),
    );
  }

  _onVerticalSwipe(direction) {
    if (direction == SwipeDirection.up) {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    } else {
      currentImage--;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onHorizontalSwipe(direction) {
    if (direction == SwipeDirection.left) {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }  
      setState(() {});
    } else if (direction == SwipeDirection.right) {
      currentImage--;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
      setState(() {});
    }
  }
}
