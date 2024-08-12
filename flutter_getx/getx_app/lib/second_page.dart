import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  //property
  var value = Get.arguments ?? "__";  //아무것도 없으면 (??)면 ___로쓰겠다


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title:const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.back(result: "Good"), 
              child: Text('Exit')
              ),
            Text("Single Argument: $value"),
            Text("Multiple Argument #1: ${value[0]}"),
            Text("Multiple Argument #1: ${value[1]}"),

            ElevatedButton(
              onPressed: () => Get.back(result: "Good"),  //2번째 페이지에서 첫페이지로 넘기기
              child: Text('Reply'),
            ),
          ],
        )
      )
    );
  }
}