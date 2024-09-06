import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/todolist.dart';

class DatabaseHandler {
  Future<Database> initializeDB2() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todolists.db'),
      onCreate:(database, version)async{
        await database.execute("""
          create table todolists(
            seq integer primary key autoincrement,
            doit text, 
            date date)
          """);
          },
          version :1,
        );
      }
  // Future<int> insertTodoList(List<TodoList> todoList) async{
  //   int result =0;
  //   final Database db = await initializeDB();
  //   for(var todoList in todoList) {
  //     result = await db.rawInsert(
  //       "insert into todolists(doit, date) values (?, date('now'))",
  //       [todoList.doit]);
  //   }
  //   return result;
  // }
  Future<int> insertTodoList(TodoList todolist) async{
    var now = DateTime.now();
    int result = 0;
    final Database db = await initializeDB2();
    result = await db.rawInsert(
      """
        insert into todolists(seq, date) values (?, ?)
      """, [todolist.doit, '${now.year}-${now.month}-${now.day}']
    );
    
    return result;
  }

  Future<List<TodoList>> queryTodoList() async{
    final Database db = await initializeDB2();
    final List<Map<String,Object?>> queryResults=
      await db.rawQuery('select * from todolists');
    return queryResults.map((e) => TodoList.fromMap(e)).toList();
  }


//데이터삭제
      Future<int> deltodolist(int seq)async{ 
    int delresult = 0;
    final Database db = await initializeDB2();
    delresult = await db.rawInsert(
      """
        delete from todolists where id= ? 
      """, [seq]
    );
    return delresult;
  }
}
