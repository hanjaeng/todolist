import 'package:flutter/material.dart';
import 'package:hjy_project_todolist_app/model/p1connect.dart';

import '../model/list.dart';
import '../model/message.dart';

class FirstPage extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; //onchangeTheme 테마모드 갖고오기 설정!!!
  // final List<TodoList> todolistP1;  required this.todolistP1
  const FirstPage({super.key, required this.onchageTheme});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //property
  late List<TodoList> p1Connect;

  @override
  void initState() {
    super.initState();
    p1Connect = [];
    // addlist();
  }

  // addlist(){
  //   Connect.p1Connectt.add(TodoList(imageName: 'images/img_time.png' , listContent: '일정' ) );
  //   Connect.p1Connectt.add(TodoList(imageName: 'images/img_shopping.png' , listContent: '구매예정' ) );
  //   Connect.p1Connectt.add(TodoList(imageName: 'images/img_check.png' , listContent: '체크할것' ) );
  //   Connect.p1Connectt.add(TodoList(imageName: 'images/img_memo.png' , listContent: '메모' ) );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('${Connect.num}'),
        actions: [
          GestureDetector(
            onTap: () {
            // Connect.num = '456';
            Navigator.pushNamed(context, '/insert').then((value) => reBuildData(),);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),

//
      body: 
          ListView.builder(
            itemCount: Connect.p1Connectt.length,      //todoList 의 길이만큼 count
            itemBuilder: (context, index){
              return Dismissible(
                direction: DismissDirection.endToStart,  // 좌로 밀어서 삭제하기
                key: ValueKey(Connect.p1Connectt[index]),
                onDismissed: (direction){
                  print('2');
                  Connect.p1Connectt.remove(Connect.p1Connectt[index]);
                  setState((){});
                },
                background: Container(
                  color: Color.fromARGB(255, 255, 179, 179),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("밀어서 삭제", style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,) ),
                      Icon(Icons.delete_forever, color: Colors.white, size: 50,),
                    ],
                  ), 
                ),
                child: GestureDetector(
                  child: Card(
                    // color: index % 2 == 0? Colors.white : Color.fromARGB(255, 236, 236, 236),
                    child: Row(
                      children: [
                        // Icon(Icons."${todoList[index].imageName}"),  아이콘 삽입이 안되;;ㅠㅠ
                        Image.asset(Connect.p1Connectt[index].imageName, width:80),
                        Text("   ${Connect.p1Connectt[index].listContent}", style: TextStyle(fontSize: 20),),
                      ],
                    
                    ),
                  )
                )
              );
            } 
          ),
    );
  }
  //---fuction---
  reBuildData(){
    if(Message.isadd){
      Connect.p1Connectt.add(TodoList(imageName: Message.imageName, listContent: Message.listContent));
      Message.isadd = false;
    }
    print('1');
    setState((){});
  }

}
