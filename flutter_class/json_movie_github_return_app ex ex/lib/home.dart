import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http; // as http에서 가져왔음으로 표기!!

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data; //data에다가 json  가져와서 --> builer에다가
  late Color selectColor;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    selectColor= Colors.white; 
  }

  getJSONData() async {
    //async는 동시에 여러개가 돌아감(네트워크움직일때 따로따로 움직여야)
    var url = Uri.parse(
        'https://zeushahn.github.io/Test/student.json'); // uri는 보내는쪽 주소도 알려줌,  url은 수신자 정보만 있음!
    var response = await http.get(url); // url 실행되서 response로 들어옴
    // print(response.body);
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); //json import
    //json을 맵 형태로
    List result = dataConvertedJSON['results'];
    //키 값을 불러와 리스트로!!{[]}
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test Ex'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('   이름   |  학번  |    전화번호   |   학과 ',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(              
              height: 500,
              child: data.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      scrollDirection: Axis.vertical, //세로로   //horizontal 횡으로
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          color: functionColor(index),  //
                              // index % 2 == 0 ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 210, 210, 210), //지그재그 색
                          child: Row(
                            children: [
                              Text(
                                " ${data[index]['name']} |",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                " ${data[index]['code']} |",
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                " ${data[index]['phone']} |",
                                style: const TextStyle(fontSize: 18),
                              ),
                              
                              Text(
                                " ${data[index]['dept']}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
  functionColor(index){
    if(data[index]['dept']=='컴퓨터공학과'){
      selectColor = Colors.grey;
    }else{selectColor = Colors.white;}
  return selectColor;
  }
}


