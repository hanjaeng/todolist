import 'package:flutter/material.dart';
import 'package:listview_todo_ex1_app/model/list.dart';
import 'package:listview_todo_ex1_app/model/message.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  late List<TodoList> todolist;  


  @override
  void initState() {
    super.initState();
    todolist = [];
    addlist();
  }

  addlist(){
    todolist.add(TodoList(imageName: 'images/cart.png' , listContent: '책구매' ) );
    todolist.add(TodoList(imageName: 'images/clock.png' , listContent: '철수와의 약속' ) );
    todolist.add(TodoList(imageName: 'images/pencil.png' , listContent: '스터디 준비하기' ) );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/insert').then((value) => reBuildData(),);
            },
            child: Icon(Icons.add)
          )
        ],
      ),

      body: ListView.builder(
              itemCount: todolist.length,
              itemBuilder : (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: ValueKey(index),
                  onDismissed: (direction) {
                    todolist.remove(todolist[index]);
                    setState(() {});
                  },
                  background: Container(
                    color: Colors.red[700],
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete_forever),
                    
                  ),
                  child: GestureDetector(
                    // onTap: () {
                    //   Message.imageName = todolist[index].imageName;
                    //   Message.listContent = todolist[index].listContent;
                    //   Navigator.pushNamed(context, '/detail');
                    // },
                    child: Card(
                      color: index %2 == 0? const Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 173, 173, 173),
                      child: Row(
                        children: [
                          Image.asset(
                            todolist[index].imageName
                          ),
                          Text("      ${todolist[index].listContent}")
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }


//Funcionts
reBuildData(){
  if (Message.isadd){
    todolist.add(TodoList(imageName: Message.imageName, listContent: Message.listContent));
    Message.isadd = false;
  }
  setState(() {});
}


}// End