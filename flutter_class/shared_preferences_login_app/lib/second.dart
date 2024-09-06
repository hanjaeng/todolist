import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late String userId;
  late String Password;

  @override
  void initState() {
    super.initState();
    userId = "";
    Password = "";
    initSharedPreferences();
  }
  
  initSharedPreferences()async{  //#2
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('p_userId')!; //null데이터도 넣어야 하므로 빨간줄 -> !넣음
    Password = prefs.getString('p_password')!;
    setState((){}); // async가있으므로 어떤게 먼저 끝날지 모름 -> setState해야 
  }

  @override
  Widget build(BuildContext context) {    //build #1
    return Scaffold(
      appBar: AppBar(
        title: const Text('ID')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User ID: $userId"),
            Text("Password $Password")
          ],
        ))
    );
  }
}