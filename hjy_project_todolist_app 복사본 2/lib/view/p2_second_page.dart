import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; //onchangeTheme 테마모드 갖고오기 설정!!!
  const SecondPage({super.key, required this.onchageTheme});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


  //Property
  late List<String> imageList;
  late int currentImageNo;
  late List<Color> boxColor;


  @override
  void initState() {
    super.initState();
    imageList = [
      '01.png',
      '02.png',
      '03.jpg',
      '04.jpg',
      '05.jpg',
      '06.png',
      '07.jpg',
      '08.jpg',
      '09.gif',
    ];
    currentImageNo = 0;
    boxColor = [
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
    Color.fromARGB(255, 158, 158, 158),
  ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(        
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,  //좌우 움직임. 안적으면 상하 기본셋팅
                itemCount: imageList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () => selectImage(index),
                    child: Container(
                      height:100,
                      width: 100,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: boxColor[index],
                        )
                      ),
                      child: Image.asset(               //return 값을 적어야함!!
                      'images/${imageList[index]}',
                      ),
                    ),
                  );
                }
              ),
            ),
              
          SimpleGestureDetector(           // body Box 슬라이드
              onHorizontalSwipe: (direction)  => onHorozontalSwipe(direction),
              child: Container(                  
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 0)),
                  child: Image.asset(
                    'images/${imageList[currentImageNo]}',
                    width: 400,
                    height: 550,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }


  //---function---


  selectImage(index){
      currentImageNo = (index);
   for(int i = 0;  i < imageList.length; i++){  //전체를 회색으로 설정하고 하나만 빨강색으로 나오게
      boxColor[i] = Color.fromARGB(255, 158, 158, 158);
      }
      boxColor[index] = Colors.red;
  setState(() {});
    }

  onHorozontalSwipe(direction) {
    //좌우 스와프 함수
    if (direction == SwipeDirection.left) {
      currentImageNo += 1; // list의 index No. +=1 됨에따라
      if (currentImageNo >= imageList.length) { // index No.를 넘어가게 되면
        currentImageNo = 0; //보이는 페이지를 0 index No.
      }
      setState(() {});
    } else {
      currentImageNo -= 1; // 이미지 -..
      if (currentImageNo < 0) {  //이미지 0보다 작으면
        currentImageNo = imageList.length - 1; // -1로
      }
      setState(() {});
    }
  }
}