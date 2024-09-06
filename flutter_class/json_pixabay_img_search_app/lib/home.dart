import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http; // as http에서 가져왔음으로 표기!!

import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key}); 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late TextEditingController textEditingController;
  late bool isReady;  //데이터가 준비되었는지 여부 나타낼 변수
  final api = '45466070-5df482b06ca580347f2eada26';  //API저장할 변수

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    data = [];
    isReady = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixaBay Image검색'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 330,
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                IconButton(
                  onPressed: () => getJsonData(),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),

            // 검색창이 비어있을때
            textEditingController.text.trim().isEmpty   
                ? const Flexible(  // isEmpty가 true.. 빈값이면
                    child: Center(   //아래문구
                      child: Text('검색된 이미지가 없습니다'),
                    ),
                  )
                : isReady  // isReady가 true면..보여줄 준비가 되었을때
                    ? Flexible(   //flexible위젯: 하위 위젯이 가능한 공간을 유연하게 배치
                        child: GridView.builder(   //이미지 그리드 형식으로 표시해라
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(  
                              onTap: () => Get.to(
                                Detail(),
                                arguments: (
                                  textEditingController.text.trim(),
                                  data[index]["largeImageURL"]
                                ),
                              ),
                              child: Card(
                                color: Colors.grey[400],
                                child: Image.network(
                                  data[index]["webformatURL"],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    // 로딩중 일때
                    : const Flexible(
                        child: Center(
                          child: CircularProgressIndicator(),  //로딩 스피너 표시
                        ),
                      )
          ],
        ),
      ),
    );
  }

  // Functions
  getJsonData() async {   //비동기함수
    isReady = false;      //a: isReady를 false로  로딩상태 표시
    setState(() {});

    data = [];   //data를 빈 리스트로 초기화
    var url = Uri.parse(   //uri.parss 문자열을 uir객체로 변환, urL다룸
        "https://pixabay.com/api/?key=${api}&q=${textEditingController.text.trim()}&image_type=photo");
        //( trim() 메서드는 앞뒤 공백을 제거)
        //img타입을 photo로 설정하여 사진만 검색
    var response = await http.get(url);
         //http.get(url)을 사용하여 지정된 url로 httpget요청을 보냄,
         //이 요청은 비동기로 처리되며 await를 사용하여 요청 완료될때가지 기다린다.
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
        //응답 본무을 Byte배열로 반환하여, utf8 문자열로 디코딩한다.
        //json.decode 디코딩된 문자열을 JSON객체로 변환한다
    List result = dataConvertedJSON["hits"];
       //JSON데이터(API로 부터 받은).. 후속처리에 사용한다.
    data.addAll(result);
    isReady = true;    //b: isReady를 true로!!설정하여 데이터 준비 표시
    setState(() {});
  }
} // End