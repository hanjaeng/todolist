import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/animal.dart';

class SecondPage extends StatefulWidget {    //list를 가져와서 추가
  final List<Animal>list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //property
  late TextEditingController nameCotroller; //TextField
  late int radioValue;  // Radio Buton :  int 0 1 2 3 숫자로 관리  
  late bool flyExist;  // Check Box : true false 
  late String imagePath;  //image 선택
  late String imageName; //선택한 Image 이름

  @override
  void initState() {
    super.initState();
    nameCotroller = TextEditingController();
    radioValue = 0;
    flyExist = false;
    imagePath = '';
    imageName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameCotroller,
              keyboardType: TextInputType.text,
              maxLength: 10,  //10장 넘어서 진행 안됨
              maxLines: 1,  //1줄 최대임 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  value:0,
                  groupValue: radioValue,
                  onChanged:(value) => radioChange(value),
                ),
                const Text('양서류'),
                Radio(
                  value:1,
                  groupValue: radioValue,
                  onChanged:(value) => radioChange(value),
                ),
                const Text('파충류'),
                Radio(
                  value:2,
                  groupValue: radioValue,
                  onChanged:(value) => radioChange(value),
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("날 수 있나요?"),
                Checkbox(
                  value: flyExist, 
                  onChanged: (value){
                    flyExist = value!;  //  옵션에 체크하는걸 !(느낌표)
                    setState((){});
                  }
                )
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal, //좌우로 하니깐 horizontal
                children: [
                  GestureDetector(
                    onTap:(){
                      imagePath = 'images/cat.png';
                      imageName = '고양이';
                      setState((){});
                    },
                    child:Image.asset(
                      'images/cat.png',
                        width:80
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      imagePath = 'images/dog.png';
                      imageName = '개';
                      setState((){});
                    },
                    child:Image.asset(
                      'images/dog.png',
                        width:80
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState((){});
                    },
                    child:Image.asset(
                      'images/cow.png',
                        width:80
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState((){});
                    },
                    child:Image.asset(
                      'images/fox.png',
                        width:80
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      imagePath = 'images/wolf.png';
                      imageName = '늑대';
                      setState((){});
                    },
                    child:Image.asset(
                      'images/wolf.png',
                        width:80
                    ),
                  ),
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              onPressed: () => _showDialog(), 
              child: const Text('동물 친구 추가하기'))
          ] 
        ),
      ),
    );
  }
  // ---Function----

  radioChange(int? value){    ///////// 
    radioValue = value!;      /////////
    setState((){});
  }
  
  _showDialog() {   //함수 //index    생성자만듦
    var animal = Animal(
      imagePath: imagePath, 
      animalName: nameCotroller.text, 
      kind: getKind(radioValue), 
      flyExist: flyExist);

    showDialog(           //dialog 전체그림
      context: context,
      barrierDismissible: false,  //barrierDismissible을 못하게 하겠다.
      builder: (context) {
        return AlertDialog(     //bilder나오면 return! alerdialog가 세부그림
          title: const Text (
            '동물 친구 추가하기',
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          '이동물 은 ${animal.animalName} 입니다.\n'
          '또 이 동물의 종류는 ${animal.kind} 입니다.\n'
          '이동물은 ${animal.flyExist ?" 날수 있습니다": "날 수 없습니다"}\n' //////
          '이 동물을 추가하시겠습니다?'
        ),
        actions:[
          TextButton(
            onPressed: (){
              widget.list.add(animal);//of : context를 추가한것
            Navigator.of(context).pop(); //pop은 지워주는것
            },
            child: Text('예')
            ),
          TextButton(
            onPressed: (){
              widget.list.add(animal);//of : context를 추가한것
            Navigator.of(context).pop(); //pop은 지워주는것
            },
            child: Text('아니오')
          ),
        ] 
        );
      }
    );                
  }
    
  getKind(radiValue){
    String returnValue = "";

    switch(radioValue){
      case 0:
        returnValue = "양서류";
      case 1:
        returnValue = "파충류";
      case 2:
        returnValue = "양서류";
      
    return returnValue;
    }
  }
}