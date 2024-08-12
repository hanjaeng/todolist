import 'package:flutter/material.dart';

import '../model/animal.dart';

class FirstPage extends StatefulWidget {   //FisrtPage는  StatefulWidget에서 상속받음!
  final List<Animal> list;  //  Animal 타입의 리스트  animal.dart와 연결!!!!!

  const FirstPage({super.key, required this.list});   //First ()생성자 생성하려면 animil 타입의 list 넣어줘!

  @override
  State<FirstPage> createState() => _FirstPageState();
}

//위와 다른 클래스!!!
class _FirstPageState extends State<FirstPage> {   /// FirstPageState는 FirstPage에서 상속받음!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,  //widget FirstPage에서 상속받음 알려줌
            itemBuilder: (context, index_card){  //card에서 보여줄 인덱스
              return GestureDetector(
                onTap: () => _showDialog(index_card),  //showdialog만들때 index정보로 가져와만들기
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[index_card].imagePath,
                        width: 100,   //FirstPage(widget)에 있는 
                      ),
                      Text(
                        "    ${widget.list[index_card].animalName}")
                  ],
                )
                            ),
              );
          }  
        ),
      )
    );
  }

// --- Function ---
  _showDialog(index_show) {   //함수 //show 에서 보여줄 index 
    showDialog(           //dialog 전체그림
      context: context,
      barrierDismissible: false,  //barrierDismissible을 못하게 하겠다.
      builder: (context) {
        return AlertDialog(     //bilder나오면 return! alerdialog가 세부그림
          title: Text (
            widget.list[index_show].animalName,
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
          ),
        ),
        content: Row(
          children: [
            Image.asset(
              widget.list[index_show].imagePath,
              width: 50,
          ),
          Text(
            '이동물은 ${widget.list[index_show].kind}입니다. \n'
            '${widget.list[index_show].flyExist ? "날 수 있습니다.":"날 수 없습니다."}',
          ),
        ]
      ),
        actions:[
          TextButton(
            onPressed: () => Navigator.of(context).pop(), //of : context를 추가한것
                                                          //pop은 지워주는것
            child: Text(' 종료 ')
          ),
        ] 
      );
    }
  );                 
}
}