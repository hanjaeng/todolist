import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // property
  late bool button2Visible;

  @override
  void initState() {
    super.initState();
    button2Visible = false; //2번째 버튼 안보이게하겠다
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                button2Visible = true;
                setState(() {});
              }, 
              child: Text('1. Button'),
            ),
            Visibility(
              visible: button2Visible,   //button 2 초기값에 따라 보이거나 안보이거나
              child: TextButton(
                onPressed: () {
                
                }, 
                child: Text('2. Button'),
              ),
            ),
            TextButton(
              onPressed: () {
              
              }, 
              child: Text('3. Button'),
            ),
          ],
        ),)
    );
  }
}