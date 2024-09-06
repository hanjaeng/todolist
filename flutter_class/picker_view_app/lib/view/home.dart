import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<String> imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width:300,
              height:250,
              child: CupertinoPicker(
                backgroundColor: Colors.amber,
                itemExtent: 100,               //picker 그림 크기
                scrollController: FixedExtentScrollController(initialItem:0),
                onSelectedItemChanged: (value) {
                  selectedItem = value;
                  setState((){});
                },
                children: List.generate(
                  10,   // length,
                  (index) => Center(
                    child: Image.asset(
                      "images/${imageName[index]}",
                      width: 100,
                    )
                  ),
                ),
                  // Image.asset(
                  //   'images/${imageName[0]}', width:50,),
                  //   'images/${imageName[1]}', width:50,),
                  //   'images/${imageName[2]}', width:50,),
                  //   'images/${imageName[3]}', width:50,),
                  //   'images/${imageName[4]}', width:50,),
                  //   'images/${imageName[5]}', width:50,),
                  //   'images/${imageName[6]}', width:50,),
                  //   'images/${imageName[7]}', width:50,),
                  //   'images/${imageName[8]}', width:50,),
                  //   'images/${imageName[9]}', width:50,),
                  )
                ),
                Text('selected Item : ${imageName[selectedItem]}'),
                SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset(
                    'images/${imageName[selectedItem]}',
                  fit: BoxFit.fill,
                  ),
                  ),
            ],
          ),
        ), 
      );
  }
}