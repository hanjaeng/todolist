import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'edit.dart';  // as http에서 가져왔음으로 표기!!

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;    //data에다가 json  가져와서 --> builer에다가

@override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  getJSONData()async{    //async는 동시에 여러개가 돌아감(네트워크움직일때 따로따로 움직여야)
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');// uri는 보내는쪽 주소도 알려줌,  url은 수신자 정보만 있음!
    var response = await http.get(url); // url 실행되서 response로 들어옴
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));  //json import  
    //json을 맵 형태로
    List result  = dataConvertedJSON['results'];
    //키 값을 불러와 리스트로!!{[]}
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
        ? const CircularProgressIndicator()  //비어있으면 뺑뺑이 돌려라
        : ListView.builder(
          scrollDirection: Axis.vertical,  //세로로   //horizontal 횡으로
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Slidable(   //Slidalbe 패키지
                startActionPane: ActionPane(
                  motion: BehindMotion(),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.green,
                      icon: Icons.edit,
                      label: 'Edit',
                      // onPressed: (context){
                      //   Get.to((Data:data, index:index))
                      // }
                      onPressed: (context) async {
                            var titleName = await Get.to(
                              const Edit(),
                              arguments: (
                                data[index]['image'],
                                data[index]['title']
                              ),
                            );
                            if (titleName != null) {
                              data[index]['title'] = titleName;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                // 오른쪽에서 왼쪽으로 슬라이드
                endActionPane: ActionPane(
                  motion: BehindMotion(), 
                  children: [   //여러개의 액션을 쓸 수 있음
                    SlidableAction(
                      backgroundColor: Colors.red,
                      icon:Icons.delete,
                      label:"delete",
                      onPressed: (context){
                        selectDelete(index); //index필요!
                      }
                    ),
                  ],
                ),
                child: Card(
                  color: index %2 == 0? Colors.amber: Colors.yellow,//지그재그 색
                  child: Row(
                    children: [
                      Padding(      // ClipRRect사용불가
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                        data[index]['image'], //키값
                        width: 100,
                                                )
                      ),
                      Text(
                        "   ${data[index]['title']}",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],),
                ),
              );
            }
          ),
        )
    );
  }
  //---Function---
  selectDelete(index){
    showCupertinoModalPopup(   // cupertino사용
      context: context, 
      barrierDismissible: false,
      builder: (context){
        return CupertinoActionSheet(  //return!!
          title: const Text('경고'),
          message: const Text('선택한항목을삭제하시겠습니까'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: (){
                data.removeAt(index);
                setState(() {});
                Get.back();
              },
              child: const Text('삭제'),
            ),
          ],

          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(), 
            child: Text('Cancel')
          ),
        );
      } 
    );
  }
}