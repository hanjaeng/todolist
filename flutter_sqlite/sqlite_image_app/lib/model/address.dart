import 'dart:typed_data';

class Address{
  final int? id;  //검색할땐 null일수도 있고 데이터있을 수도 있으므로 ?로 
  final String name;
  final String phone;
  final String address;
  final String relation;
  final Uint8List image; //Image Type 이미지는 Uint 8비트의 리스트타입을 씀

  Address(
    {
      this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.relation,
      required this.image});

  Address.fromMap(Map<String, dynamic> res)
  : id = res['id'],    //[]sqlite에서 컬럼이름
  name = res['name'],
  phone = res['phone'],
  address = res['address'],
  relation = res['relation'],
  image= res['image'];
}