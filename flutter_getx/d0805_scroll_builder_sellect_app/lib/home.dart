import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

//property
late List<String> animalList;
late List<Color> animalColor;
late String selectedName;

  @override
  void initState() {
    super.initState();
    animalList = [
      'bee.png',
      'cat.png',
      'cow.png',
      'dog.png',
      'fox.png',
      'monkey.png',
      'pig.png',
      'wolf.png',
    ];

  animalColor = [
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
  ];

  selectedName = '';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrool & Builder Test'),
      ),
      body: Column(
        children: [
          Text('원하는 동물을 선택하세요'),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,  //좌우 움직임. 안적으면 상하 기본셋팅
              itemCount: animalList.length,
              itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () => rebuildBorder(index),
                    child: Container(
                      height:100,
                      width: 100,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: animalColor[index],
                        )
                      ),
                      child: Image.asset(               //return 값을 적어야함!!
                      'images/${animalList[index]}'
                                        ),
                    ),
                    );
                  }
                )
                
          
          ),
          Text(selectedName),
        ],
      ),
    );
  }

  // ---function --- 
  rebuildBorder(index){
    for(int i = 0;  i < animalList.length; i++){  //전체를 노란색으로 설정하고 하나만 빨강색으로 나오게
      animalColor[i] = Colors.yellow;
    }

    animalColor[index] = Colors.red;
    selectedName = animalList[index];
    setState(() {});
  }


}