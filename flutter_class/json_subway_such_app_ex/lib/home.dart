import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String stationName;
  late List data;
  late TextEditingController textEditingController;
  final api = '54714f495468616e3131396e526b4c64';   // api호출에 사용할 키 저장하는 변수

  @override
  void initState() {
    super.initState();
    stationName = "";
    textEditingController = TextEditingController();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seoul Subway'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: textEditingController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      stationName = textEditingController.text.trim();
                      getJSONData();
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            Flexible(  //flexible위젯 사용
              child: data.isNotEmpty  //데이터 안비어있냐?
              ? ListView.builder(  //true 안비었으면 listview 빌더로 데이터를 리스트 형식 표시
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: index % 2 == 0 ? Colors.brown[100] : Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '열차 구분 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["updnLine"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '열차 방면 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["trainLineNm"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '현재 위치 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["arvlMsg3"],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '도착 시간 : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data[index]["arvlMsg2"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )       // 데이터가 비어 있으면 아래 텍스트 표시
              : const Center(child: Text('역이 잘못 입력되었습니다'),),
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  getJSONData() async {   //비동기 메서드!
    data.clear();         // 기존 데이터 초기화함
    var url = Uri.parse(   // api url 구성하는데 http:get(url)사용 데이터 가져옴
        'http://swopenapi.seoul.go.kr/api/subway/${api}/json/realtimeStationArrival/1/5/$stationName');
    var response = await http.get(url);
    //  http:패키지를 사용하여 비동기적으로 get욫어 보내고 응답 기다림. await는 완료될때가지 기다림
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    //응답을utf8로 디코딩하고, JSON으로 변환하여..  dataConvertedJSON에 저장
    //(respons.bodybyte는 http응답의 바이트 배열->이를 utf8로 디코딩JSON 객체로 변환
    // print(dataConvertedJSON["errorMessage"]);
    if (dataConvertedJSON["errorMessage"] != null) {
    //JUON응답에 errorMessage필가 있는 지 확인. 있는경우 실시간 도착정보 추풀
      List realtimeArrivalList = dataConvertedJSON["realtimeArrivalList"];
      //realtimeArrivalList 필드에서 실시간 도착 정보를 추출한다.
      data = realtimeArrivalList;
      //data는 화면에 표히할 데이터리스트로,, realtimeArrivalList는 추출한 정보를 data변수에 저장
    }
    setState(() {});
  }
} // 
