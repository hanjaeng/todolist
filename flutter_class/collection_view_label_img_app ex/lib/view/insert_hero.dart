import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertHero extends StatefulWidget {
  const InsertHero({super.key});

  @override
  State<InsertHero> createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  //property
  late TextEditingController textEditingController;


  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();  //
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인물추가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '인물을 추가하세요'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  String resultMessage = ""; 
                  if(textEditingController.text.trim().isNotEmpty){
                    resultMessage= textEditingController.text.trim();
                  } //썼으면 쓴글
                  Get.back(result: resultMessage);  //아무것도 없으면 이전화면(없어짐)
                }, 
                child: Text('추가'),
              ),
            ),
          ],
        ),
      )
    );
  }
}