import 'package:flutter/material.dart';

import '../model/animal.dart';
import 'first_page.dart';
import 'second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {    
   //tab bar 넣으려면 with Single~~~~~
  
   //Property
  late TabController controller;   //컨트롤러정의
  late List<Animal> animalList;    //animalList는 Animal에서 가져오는 리스트!

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);   //2개짜리 탭바
    animalList =[];
    addList();
  }
  
  addList(){
//List써서 for문으로 하는 방법!
    List<String> imagePathList = [       
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png'
    ];
    List<String> aimalNameList = [
      '벌',
      '고양이',
      '소',
      '개',
      '여우',
      '원숭이',
      '돼지',
      '늑대'
    ];
    List<String> kindList = [
      '곤충',
      '포유류',
      '포유류',
      '포유류',
      '포유류',
      '영장류',
      '포유류',
      '포유류'
    ];
    List<bool> flyExistList = [
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];

    for(int i =0 ; i < imagePathList.length; i++){
      animalList.add(Animal(
        imagePath: imagePathList[i],
        animalName: aimalNameList[i],
        kind: kindList[i],
        flyExist: flyExistList[i]),);
    }
//List 하나씩 적는방법!!!
    // animalList.add(Animal(imagePath: 'image/bee.png', animalName: '벌', kind: '곤충', flyExist: true));
    // animalList.add(Animal(imagePath: 'image/bee.png', animalName: '고양이',  kind: '포유류', flyExist: false));
    // animalList.add(Animal(imagePath: 'image/cow.png', animalName: '소',  kind: '포유류',  flyExist: false));
    // animalList.add(Animal(imagePath: 'image/dog.png', animalName: '개',  kind: '포유류',  flyExist: false));
    // animalList.add(Animal(imagePath: 'image/fox.png', animalName: '여우', kind: '포유류', flyExist: false));
    // animalList.add(Animal(imagePath: 'image/monkey.png', animalName: '원숭이', kind: '영장류', flyExist: false));
    // animalList.add(Animal(imagePath: 'image/pig.png', animalName: '돼지', kind: '포유류', flyExist: false));
    // animalList.add(Animal(imagePath: 'image/wolf.png', animalName: '늑대', kind: '포유류', flyExist: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Test'),
      ),

      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(               // fistpage list 
            list: animalList,
          ),
          SecondPage(               //
            list: animalList,           
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}