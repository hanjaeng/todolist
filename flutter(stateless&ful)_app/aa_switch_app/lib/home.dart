import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
//Property
  late bool switchValue;
  late String appBarTitle;
  late String imageName;

  @override
  void initState(){
    super.initState();
    switchValue = true;
    appBarTitle = "Pikachu - 1";
    imageName = "pikachu-1.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$appBarTitle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if(switchValue){
                  switchValue = false;
                } else{
                  switchValue = true;
                }
                checkScreen();
              },
              child: Image.asset(
                'images/$imageName',
                width: 100,
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: Switch(          //bull 타입으로 true  false
                value: switchValue,    // 화면에 보이는 value  
                onChanged: (value){   // 사용자가 바꿨을때
                  switchValue = value;  //action 시
                  checkScreen();}
              ),
            )  //사용자가 바꾼값을 화면 고정 조정함
          ]
        )
      )   
    );
  }
  //----Functions ---
  checkScreen(){
    if(switchValue){    // =if(switchValue == true) if는 항상 true물음
      appBarTitle = "Pikachu - 1";
      imageName = "pikachu-1.jpg";
    } else{
      appBarTitle = "Pikachu - 2";
      imageName = "pikachu-2.jpg";      
    }
    setState((){});
  }

}//END