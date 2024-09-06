import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/restaurant.dart';

class DatabaseHandler{
  Future<Database> initializeDB()async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "restaurant.db"),
      onCreate: (db, version) async{
        await db.execute(
          '''
            create table restaurant
            (
              seq integer primary key autoincrement,
              name text,
              phone text,
              locate text,
              latitude real,
              longitude real,
              memo text,
              img blob
              )
          '''
        );
      },
      version: 1,
    );
  }

  //--open list--
    Future<List<Restaurant>> query_restaurant() async{
  final Database db = await initializeDB();
  final List<Map<String,Object?>> queryResult=
      await db.rawQuery('select * from restaurant');
  return queryResult.map((e) => Restaurant.fromMap(e)).toList();
  }



//-----리스트추가-----
  Future<int> InsertRestaurant(Restaurant insert_restaurant)async{  //모델 만들어줌
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      """
      insert into restaurant(name, locate, phone, latitude, longitude, memo, img)
      values (?,?,?,?,?,?,?)
      """,
      [
        insert_restaurant.name,
        insert_restaurant.locate,
        insert_restaurant.phone,
        insert_restaurant.latitude,
        insert_restaurant.longitude,
        insert_restaurant.memo,
        insert_restaurant.img
      ]
    );
    return result;
  }

  //-----수정-----
  Future<int> updateCard(Restaurant update_restaurant)async{  
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate(
      """
    UPDATE restaurant
    SET name = ?, locate = ?, phone = ?, latitude = ?, longitude = ?, memo = ?, img = ?
    WHERE seq = ?
    """,
    [
      update_restaurant.name,
      update_restaurant.locate,
      update_restaurant.phone,
      update_restaurant.latitude,
      update_restaurant.longitude,
      update_restaurant.memo,
      update_restaurant.img,
      update_restaurant.seq,
    ]
  );
    return result;
  }

    //-----삭제-----
  Future<int> delCard(int seq)async{  
    int delresult = 0;
    final Database db = await initializeDB();
    delresult = await db.rawUpdate(
      //데이터 에러시 입력x -> 0 / 데이터 입력 저장 수 에따라 -> 1,2,3,
      //SQL소스 삭제는 key값을 찾아서 삭제
      """
        delete from restaurant where seq = ? 
      """, [seq]
    );
    print("delete return value: $delresult");
    return delresult;
  }


}