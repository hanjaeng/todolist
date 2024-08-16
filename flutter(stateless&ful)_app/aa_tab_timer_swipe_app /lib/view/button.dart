import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _HomeState();
}

class _HomeState extends State<Button> {
  late List<String> imageName;
  late int currentImage;
  late int nextpage;
  late int prevpage;

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
    nextpage = currentImage + 1;
    prevpage = (imageName.length-1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    imageName[currentImage],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( // 안에 색깔 넣을떄 사용
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 9,
                        ),
                      ),
                      child: Image.asset(
                        'images/${imageName[currentImage]}',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        )
                      ),
                      child: Image.asset(
                        'images/${imageName[nextpage]}',
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        )
                      ),
                      child: Image.asset(
                        'images/${imageName[prevpage]}',
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => _pretButtonPressed(),
                        child: const Text(
                          '<< 이전',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => _nextButtonPressed(),
                        child: const Text(
                          '다음 >>',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _nextButtonPressed() {
    prevpage++;
    currentImage++;
    nextpage++;
    if (currentImage >= imageName.length) {
      currentImage = 0;
    }
    if (nextpage >= imageName.length) {
      nextpage = 0;
    }
    if (prevpage >= imageName.length) {
      prevpage = 0;
    }
    setState(() {});
  }

  _pretButtonPressed() {
    currentImage--;
    nextpage--;
    prevpage--;
    if (currentImage < 0) {
      currentImage = imageName.length - 1;
    }
    if (nextpage < 0) {
      nextpage = imageName.length - 1;
    }
    if (prevpage < 0) {
      prevpage = imageName.length - 1;
    }
    setState(() {});
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
