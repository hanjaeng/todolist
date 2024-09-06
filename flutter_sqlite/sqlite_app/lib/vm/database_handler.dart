import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/students.dart';

class DatabaseHandler{
  Future<Database> initalizeDB() async{  //외부에서 가져오는것들은 async로 생각하면됨
    String path = await getDatabasesPath();  //awilt: pass를 가져온다음에 데이터베이스!!
    return openDatabase(        // openDatabase에 아래 내용을 리턴
      join(path, 'student.db'), //가져온 경로에 student데이터를 join한다
      onCreate: (db, version) async{ //데이터 가져와 만든다. 데이터 가져올때까지 정지
        await db.execute("""  
          create table students (
            seq integer primary key autoincrement,
            code text,
            name text,
            dept text,
            phone text)
        """);
      },
      version: 1
    );
  }

  Future<int> insertStudents(Students student)async{  //입력될때까지 기다려(끝나고 해라) Student 모델에 저장
    int result = 0;
    final Database db = await initalizeDB();
    result = await db.rawInsert(
      //데이터 에러시 입력x -> 0 / 데이터 입력 저장 수 에따라 -> 1,2,3,
      //seq는 자동생성이므로 여기에 안씀  / 타입을 모르므로??  
      """
        insert into students(code, name, dept,phone)  
        values(?,?,?,?) 
      """, [student.code, student.name, student.dept, student.phone]   //데이터4개 가져dhktj dlqfur
    );
    print("Insert return value: $result");
    return result;
  }
  Future<List<Students>> queryStudents()async{
    final Database db = await initalizeDB();  //DB가 어디에 있는지 알려줌
    final List<Map<String,Object?>> queryResults=   
    //검색결과가 queryResults에 있음, Map타입을 List타입으로 받음([]에있는것을 리스트로)
      await db.rawQuery('select * from students'); 
    return queryResults.map((e) => Students.fromMap(e)).toList();
  }

//데이터수정
    Future<int> updateStudents(Students student)async{  //입력될때까지 기다려(끝나고 해라) Student 모델에 저장
    int result = 0;
    final Database db = await initalizeDB();
    result = await db.rawUpdate(
      //데이터 에러시 입력x -> 0 / 데이터 입력 저장 수 에따라 -> 1,2,3,
      //seq는 자동생성이므로 여기에 안씀  / 타입을 모르므로??  
      """
        update students set name =? ,dept =?, phone =? where code =?  
      """, [student.name, student.dept, student.phone, student.code]   //데이터4개 가져와서 입력
    );
    print("Update return value: $result");
    return result;
  }

//데이터삭제
      Future<int> delStudents(String code)async{  //입력될때까지 기다려(끝나고 해라) Student 모델에 저장
    int delresult = 0;
    final Database db = await initalizeDB();
    delresult = await db.rawUpdate(
      //데이터 에러시 입력x -> 0 / 데이터 입력 저장 수 에따라 -> 1,2,3,
      //SQL소스 삭제는 key값을 찾아서 삭제
      """
        delete from students where code = ? 
      """, [code]
    );
    print("delete return value: $delresult");
    return delresult;
  }
} 