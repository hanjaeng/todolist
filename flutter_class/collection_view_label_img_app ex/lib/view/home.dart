import 'package:collection_view_label_app/view/insert_hero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.dart';

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

  addList() {
    heroList.add('images/flower_01.png');
    heroList.add('images/flower_02.png');
    heroList.add('images/flower_03.png');
    heroList.add('images/flower_04.png');
    heroList.add('images/flower_05.png');
    heroList.add('images/flower_06.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flower'),
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
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: GridView.builder(
            itemCount: heroList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 50,
            ),
            itemBuilder: (context, index) {
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
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  heroList[index],
                                  width: 100,
                                ),
                              ),
                              RotationTransition(
                                turns: AlwaysStoppedAnimation(-45 / 360),
                                child: Text(
                                  heroList[index],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
              );
            },
          ),
        ),
      ),
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
