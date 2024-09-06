import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sqlite_app/view/insert_students.dart';
import 'package:sqlite_app/view/update_students.dart';
import 'package:sqlite_app/vm/database_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHandler handler = DatabaseHandler();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQlite for Studets'),
        actions: [
          IconButton(
            onPressed: () => Get.to(const InsertStudents())!.then((value) =>reloadData(),
          ), 
            icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),  
        //queryStudents에서 handler가져와서 fluturBuilder실행시킨다
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,  //database queryStudentsd에서  dynamic?>>
              itemBuilder: (context, index){
                return Slidable(
                  endActionPane: ActionPane( //왼쪽슬라이스! / startAction은 오른쪽
                    motion: BehindMotion(),  //stretchMotion은 BehindMotion
                    children: [
                      SlidableAction(
                      backgroundColor: Colors.red,
                      icon:Icons.delete,
                      label:"delete",
                      onPressed: (context)
                        => deleteDialog(snapshot.data![index].code), //index필요!
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(
                        () => const UpdateStudents(),
                        arguments: [
                          snapshot.data![index].code,
                          snapshot.data![index].name,
                          snapshot.data![index].dept,
                          snapshot.data![index].phone,
                          ])!
                      .then((value) =>reloadData());
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('학번 : ', 
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].code)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('이름 : ', 
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].name)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('전공 : ', 
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].dept)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('전화번호 : ', 
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].phone)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  ),
                );
              }
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
//fuction
  reloadData(){
    setState(() {});
  }
  deleteDialog(String code) {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.delStudents(code);
              Get.back();
              reloadData();
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