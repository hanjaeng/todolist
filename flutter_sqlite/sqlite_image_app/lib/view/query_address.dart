import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:sqlite_image_app/view/insert_address.dart';
import 'package:sqlite_image_app/view/update_address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class QueryAddress extends StatefulWidget {
  const QueryAddress({super.key});

  @override
  State<QueryAddress> createState() => _QueryAddressState();
}

class _QueryAddressState extends State<QueryAddress> {
  //Property
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록검색'),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(
                () => const InsertAddress()
              )!.then((value) => reloadData());
            }, 
            icon: Icon(Icons.add_outlined))
        ],
      ),
      body: FutureBuilder(
        future: handler.query_address(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:(context, index){
                return Slidable(
                  endActionPane: ActionPane( //왼쪽슬라이스! / startAction은 오른쪽
                    motion: BehindMotion(),  //stretchMotion은 BehindMotion
                    children: [
                      SlidableAction(
                      backgroundColor: Colors.red,
                      icon:Icons.delete,
                      label:"delete",
                      onPressed: (context)
                        => deleteCard(snapshot.data![index].id!), //index필요!
                      ),
                    ],
                  ),

                  child: GestureDetector(
                    onTap:  () {
                      Get.to(( )=> UpdateAddress(),
                      arguments: [ 
                        snapshot.data![index].id!,
                        snapshot.data![index].name,
                        snapshot.data![index].phone,
                        snapshot.data![index].address,
                        snapshot.data![index].relation,
                        snapshot.data![index].image,
                      ])!
                      .then((value) => reloadData());
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Image.memory(
                            snapshot.data![index].image,
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('이름: ',
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(snapshot.data![index].name)
                                  ],
                                ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                  children: [
                                    Text('전화번호: ',
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(snapshot.data![index].phone)
                                  ],),
                                ),
                            ],
                          )
                        ],)
                    ),
                  ),
                );
              },);
          }else{
            return const Center(
              child:CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
  //function
  reloadData(){
    setState(() {});
  }

deleteCard(int id) {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.delCard(id);
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