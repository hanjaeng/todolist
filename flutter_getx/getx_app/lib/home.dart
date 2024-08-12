import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//------------------------------------- 화면이동 ----------//
            Text('Navigation'),
            ElevatedButton(
              onPressed: ()=> Get.to(SecondPage(),
                transition: Transition.fadeIn,
                duration: const Duration(seconds:2),
              ),
              child: Text('Get.to(): 화면이동'),
              ),
              
            ElevatedButton(
              onPressed: ()=> Get.toNamed('/second'),
              child: Text('Get.toNamed(): 화면이동')
            ),
            Divider(
              thickness:0.5,
              color: Colors.black,
            ),
//------------------------------------- 스낵바 -------------//
            Text('snack Bar'),
            ElevatedButton(
              onPressed: () => buttonSnackBar(),
              child: Text('SnackBar 보이기'),
            ),

            Divider(
              thickness:0.5,
              color: Colors.black,
            ),
//-------------------------------- alert 다이얼로그 알림 ----------//
            Text('Dialog'),
            ElevatedButton(
              onPressed: () => buttonDialog(),
              child: Text('다이얼로그 알림'),
            ),
            Divider(
              thickness:0.5,
              color: Colors.black,
            ),
//----------------------------------- 아래 시트 보이기----------//
            ElevatedButton(
              onPressed: () => buttonBottomSheet(),
              child: Text('아래 시트 보이기'),
            ),
            Divider(
              thickness:0.5,
              color: Colors.black,
            ),
//------------------------------------- 네이베이션 & argument----------//
            Text('Navigation & Argumetns'),
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: 'First',),              
              child: Text('Get.to() :Single Argment'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: ["First", "Second"],
              ),
              child: Text('Get.to() : Multipl Argments'),
            ),
            Divider(
              thickness:0.5,
              color: Colors.black,
            ),
//------------------------------------- 화면이동 & 되돌아올때 창 뜨게 ---------//

            ElevatedButton(          // 버튼 눌렀을때 2번째 페이지 넘겨 받을 수 있음.   ***** 고급 **
              onPressed: () async{   // 같은메모리 못씀 (pause에 이미 걸려 있으므로) --> (async 활용!!)
                var returnValue = await Get.to(SecondPage()); //2번째 페이지 끝날때가지 기다려!(awit끝날때가지)
                Get.snackbar("Return Value", returnValue); //2번째 페이지 끝나면 들어와!
              },
              child: Text('Get.to() : Return Argument'),
            ),
          ],
        ),
      )
    );
  }
  buttonSnackBar(){
    Get.snackbar(
      "snack Bar", 
      "Message",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.amber,
    );
  }

  buttonDialog(){
    Get.defaultDialog(
      title:"Dialog",
      middleText: 'Message',
      backgroundColor: Colors.yellowAccent,
      barrierDismissible: false,   //입력안되게 할꺼야
      actions: [ 
        TextButton(
          onPressed: ()=> Get.back(), 
          child: Text('Exit'),),  
      ]
    );
  }
  
  buttonBottomSheet(){
    Get.bottomSheet(
      Container(
        width: 500,
        height: 300,
        color: Colors.pink[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text Line1'),
            Text('Text Line2'),
            Text('Text Line3'),
            TextButton(
              onPressed: () => Get.back(), 
              child: Text('Exit')),
          ],
        ),
      )
    );
  }
}