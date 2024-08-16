import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String fullText;
  late String cellText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cellText = '대';
    fullText = '대한민국';
    

    //Timer 설치
    Timer.periodic(Duration(seconds: 1),
    (timer) {
      cchangeText();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Led 광고'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cellText,
              // ledTextAdv[ccurrentPage],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),              
              
            )
          ],
        )
      )
    );
  }
  //--fuction--
  cchangeText(){
    if(cellText == '대'){
      cellText += '한';
    }
    setState(() {
      
    });
  }

}