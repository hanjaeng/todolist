import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:simple_todo_list_app_ex/model/todolist.dart';
// import 'package:getx_app/second_page.dart';
import 'package:simple_todo_list_app_ex/view/update.dart';

import '../vm/database_handler.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController todocontroller;
  DatabaseHandler handler= DatabaseHandler();

@override
  void initState() {
    super.initState();
    todocontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Lists"),
        actions: [
          IconButton(
            onPressed: () => addtodo(context),
            icon: Icon(Icons.add_outlined),
          )
        ],
      ),

      body: FutureBuilder(
        future: handler.queryTodoList(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return SlidableAutoCloseBehavior(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: BehindMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label:"delete",
                          onPressed: (context){
                            deltodolist(snapshot.data![index].seq!);
                          },
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onTap:(){
                        Get.to(
                          () => const Update(),
                          arguments: [
                            snapshot.data![index].seq,
                            snapshot.data![index].doit,
                            snapshot.data![index].date,
                          ]
                        )!
                        .then((value) => reloadData());
                      },
                    
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.today),
                                // Text(snapshot.data![index].todo),
                                // Text(" / "),
                                // Text(snapshot.data![index].date) 에러;;;
                                Text("${snapshot.data![index].doit}, / ${snapshot.data![index].date}"),
                              ],
                            ),
                          )
                        ],
                      )
                    )
                  ),
                );
                },
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

//fuction
  reloadData(){
    setState(() {});
  }


  addtodo(context){
    showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: const Text('Todo List'),
        content: TextField(
          controller: todocontroller,
          decoration: const InputDecoration(
                  labelText: '추가할 내용',
                  // fillColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            actions: [   
              Center(
                child: TextButton(
                onPressed: ()async{  
                TodoList todolist = TodoList(         
                  doit: todocontroller.text.trim(), 
                );
                int result = await handler.insertTodoList(todolist);
                if (result == 0) {
                    errorSnackBar();
                  } else {
                    Get.back();
                    todocontroller.text = "";
                    setState(() {});
                    successShowDialog();
                  }
                },
              child: Text('추가하기'),
            ),
            ),
            ],
              );
            },
          );
        }
    

  errorSnackBar() {
    Get.snackbar(
      "경고",
      "입력중 문제가 발생 하였습니다.",
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  successShowDialog() {
    Get.defaultDialog(
        title: '입력 결과',
        middleText: '입력이 완료 되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          )
        ]);
  }



  deltodolist(int id) {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.deltodolist(id);
              Get.back();
              setState(() {});
            },
            child: const Text('예'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('아니오'),
          ),
        ]);
  }

  }
