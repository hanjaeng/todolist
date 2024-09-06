class Students{
//property
  int? seq;    // ? 입력시 일련번호 자동생성번호로 미확정   
  String code;
  String name;
  String dept;
  String phone;


  // Constructor   생성자
  Students(
    {
      this.seq,     // 위에 ?(null set)해서 required안해도 됨
      required this.code,
      required this.name,
      required this.dept,
      required this.phone
    }
  );

  //모델은 생성자 없음
  //맵을 리스트로 바꿈
  Students.fromMap(Map<String,dynamic> res)
  : seq = res['seq'],
  code = res['code'],
  name = res['name'],
  dept = res['dept'],
  phone = res['phone'];  
  // 아래처럼 써도 됨
  // factory Students.fromMap(Map<String,dynamic>res){ //생성자의 함수를 쓰고 싶을때
  //   return Students(
  //     seq: res['seq'],
  //     code: res['code'],
  //     name: res['name'],
  //     dept: res['dept'],
  //     phone: res['phone']);
  // }
}
