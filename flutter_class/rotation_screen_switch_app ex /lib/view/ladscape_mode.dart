import 'package:flutter/material.dart';

class LandscapeMode extends StatefulWidget {
  const LandscapeMode({super.key});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
//property
  late bool value;
  late String changeText;
  late String changeColor;

  @override
  void initState() {
    super.initState();
    value = true; 
    changeText = 'Hello';
    changeColor = 'blue';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: ElevatedButton(
          onPressed: () => changeButton(value),
          child: Text(changeText),
          style: Colors.changeColor,
          ),
      )
    );
  } 
  //--function--
  changeButton(value){
    if(value==true){
      value = false;
      changeText = 'Flutter';
      changeColor = 'red';
    }else{value = true;
    changeText = 'hellow';
    changeColor = 'blue';
    }
  }
}