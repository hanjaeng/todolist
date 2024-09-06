import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_image_app/model/address.dart';

class DatabaseHandler{

  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "address.db"),  //경로
      onCreate: (db, version) async{
        await db.execute(
          """
            create table address
            (
              id integer primary key autoincrement,
              name text,
              phone text,
              address text,
              relation text,
              image blob  
            )
          """
          //이미지 영상 음악 모두 blob로 들어감
        );
      },
      version: 1,
    );
  }

  Future<int> insertAddress(Address address)async{  //모델 만들어줌
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      """
      insert into address(name, phone, address, relation, image)
      values (?,?,?,?,?)
      """,
      [
        address.name,
        address.phone,
        address.address,
        address.relation,
        address.image
      ]
    );
    return result;
  }

  Future<List<Address>> query_address() async{
  final Database db = await initializeDB();
  final List<Map<String,Object?>> queryResult=
      await db.rawQuery('select * from address');
  return queryResult.map((e) => Address.fromMap(e)).toList();
  }



  Future<int> updateAddress(Address address)async{  //모델 만들어줌
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate(
      //이미지 업데이트 안함
      """
      update address
      set name = ?, phone = ?, address = ?, relation = ?, 
      where id = ?
      """,
      [
        address.name,
        address.phone,
        address.address,
        address.relation,
        address.id
      ]
    );
    return result;
  }

  Future<int> updateAddressAll(Address address)async{  //모델 만들어줌
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate(
      //이미지 업데이트
      """
      update address
      set name = ?, phone = ?, address = ?, relation = ?, image = ?   
      where id = ?
      """,
      [
        address.name,
        address.phone,
        address.address,
        address.relation,
        address.image,
        address.id
      ]
    );
    return result;
  }

//데이터삭제
      Future<int> delCard(int id)async{  //입력될때까지 기다려(끝나고 해라) Student 모델에 저장
    int delresult = 0;
    final Database db = await initializeDB();
    delresult = await db.rawUpdate(
      //데이터 에러시 입력x -> 0 / 데이터 입력 저장 수 에따라 -> 1,2,3,
      //SQL소스 삭제는 key값을 찾아서 삭제
      """
        delete from address where id = ? 
      """, [id]
    );
    print("delete return value: $delresult");
    return delresult;
  }



}