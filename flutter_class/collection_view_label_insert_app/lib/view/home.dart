import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.dart';
import 'insert_hero.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = [];
    addList();
  }
  
  addList(){
    heroList.add('유비');
    heroList.add('관우');
    heroList.add('조조');
    heroList.add('장비');
    heroList.add('조운');
    heroList.add('손책');
    heroList.add('여포');
    heroList.add('손권');
    heroList.add('초선');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼국지 인물'),
        actions: [
          IconButton(
            onPressed: () => Get.to(InsertHero())!.then(
              (value) => rebuidData(value.toString()),
            ), //!없는값(null)처리할때 옵셔널 처리  // insert갔다 왔을때 value값 같고옴
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5,0,5,0),
          child: GridView.builder(
            itemCount: heroList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context,index){
              return Container(
                // color: Colors.grey,
                color : index %3 == 0   // index 3 나머지가 0 (index는 0부터)
                  ? Colors.red       //// true  -> 빨강
                  : index %2 == 0       // index 2 나머지가 0 
                      ? Colors.green  //  true -> 녹색
                      : Colors.amber,  // 그외 노랑
                child: GestureDetector(
                  onTap: () => Get.to(
                        DetailHero(),
                    arguments: heroList[index],
                    ),
                  child: Card(
                    color : Theme.of(context).colorScheme.primaryContainer,
                    child: Center(
                      child: Text(heroList[index]),)
                  ),
                ),
              );
            },
            ),
        )
      )
    );
  }
 //---Functions --
  rebuidData(String value) {
    if (value.isNotEmpty && value != 'null') {
      heroList.add(value);
    }
    setState(() {});
  }
}
