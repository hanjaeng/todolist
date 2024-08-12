main(){
  //
  String name1 = '유비';
  name1 = '장비';
  print(name1);

  final String name2 = '관우';
  //name2 = '조조';

  const String name3 = '조장룡';
  //name2 = '조조';
  //const는 자바에 없다. 
  //final과 const의 차이점
  final DateTime now1 = DateTime.now();
  print(now1);
  // final은 실행시에 결정되는 값으로 설정 되고  --> 실행이 되야 바꿀 수 있다. (프로그램 개발할때 주로)
  // const는 정해진 값으로만 수용 --> 중간에 바꿀 수 없다.(디자인 할때 주로 많이 씀)

}