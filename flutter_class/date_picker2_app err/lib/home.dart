import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String currentDateTime;
  // late DateTime chosenDateTime;
  DateTime? chosenDateTime; //초기값 뭔지 모를때
  late final bool _isRunning; //final은 실행될때 나와야하는값
  late Color backColor;

  @override
  void initState() {
    super.initState();
    currentDateTime = "";
    _isRunning = true;
    backColor = Colors.white;

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!_isRunning) {
          timer.cancel();
        }
        _addItem();
      },
    );
  }

  _addItem() {
    final DateTime now = DateTime.now();
    currentDateTime =
      "${now.year}-${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")} ${_weekdayToString(now.weekday)} ${now.hour.toString().padLeft(2, "0")}: ${now.minute.toString().padLeft(2, "0")}";
      setState((){});
        //XXX "${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")} ${_weekdayToString(now.weekday)} ${now.hour.toString().padLeft(2, "0")}: ${now.minute.toString().padLeft(2, "0")}";

    // print(currentDateTime);
    // print('--');
    //XXX String chosenDate = "${chosenDateTime!.month.toString().padLeft(2, "0")}-${chosenDateTime!.day.toString().padLeft(2, "0")} ${_weekdayToString(chosenDateTime!.weekday)} ${chosenDateTime!.hour.toString().padLeft(2, "0")}: ${chosenDateTime!.minute.toString().padLeft(2, "0")}";
    // print(chosenDateTime);

    
    //XXX if (currentDateTime == chosenDate) {
    //XXX   backColor = Colors.amber;
    //XXX } else {
    //XXX   backColor = Colors.white;
    //XXX }
    //XXX setState(() {});
  }

  String _weekdayToString(int weekday) {
    String dateName = "";
    switch (weekday) {
      case 1:
        dateName = "월";
      case 2:
        dateName = "화";
      case 3:
        dateName = "수";
      case 4:
        dateName = "목";
      case 5:
        dateName = "금";
      case 6:
        dateName = "토";
      case 7:
        dateName = "일";
    }
    return dateName; //return쓰면 위에 타입적어주는게 좋음 ("String" _weekdayToS~~
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재시간: ${currentDateTime}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 300,
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(), //초기값
                  use24hFormat: true,
                  onDateTimeChanged: (value) {
                    chosenDateTime = value;
                  },
                )),
            Text(
                "선택시간: ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택하세요!"}" //null이 아니면, //?에는 !
                ),
          ],
        ),
      ),
    );
  }

  //---function---
  String _chosenItem(DateTime now) {
    String chosenDateTime =
        "${now.year} - ${now.month.toString().padLeft(2, "0")} - ${now.day.toString().padLeft(2, "0")} ${_weekdayToString(now.weekday)} ${now.hour.toString().padLeft(2, "0")}: ${now.minute.toString().padLeft(2, "0")}";
    return chosenDateTime;
  }
}
