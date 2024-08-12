main(){
  // Collection; List, Map(Dictionary), Set
  // List Collection
  // 선언
  List threekingdoms = []; //대괄호 안에 list담아둠 선언   *** threekingdom는 다이내믹으로 문자 숫자 둘다 됨

  // List에 추가하기
  threekingdoms.add('위');   
  threekingdoms.add('오');
  threekingdoms.add('촉');

  //print(threekingdoms);
    
  // 위만 출력
  //print(threekingdoms[0]);  // 순서 0번째 출력

  // List의 수정 : 위 --> We
  threekingdoms[0] = "We";
  
  // List의 삭제
  // 번지수(index)로 삭제
  threekingdoms.removeAt(1); // 순서 1번빼 삭제
  
  // 데이터로 삭제
  threekingdoms.remove('We'); //we 삭제

  // List의 데이터 갯수
  //print(threekingdoms.length); //데이터 갯수

  threekingdoms.add(1);

  //print(threekingdoms);

  // -----------------------------------------------------
  // List의 정해진 변수 타입의 데이터만 추가하기
  // -----------------------------------------------------
  List<String> threekingdoms2 = [];
  threekingdoms2.add('We');  // 문자만가능
  // threekingdoms2.add(1);

  /*
  Ex:
  1. threekingdoms4라는 List를 생성하는데 Generic은 String으로 선언하기
  2. threekingdoms4에 '위', '촉', '오'의 순서로 데이터 추가하기
  3. threekingdoms4에 데이터를 'We, '촉', 'Oh'로 변경하기
  4. threekingdoms4에 'Oh'만 빼고 삭제하기
  5. 현재 남아 있는 데이터 갯수를 "현재 데이터 갯수는 1개 입니다."라고 출력하기
  6. "현재 남아 있는 나라는 Oh 입니다." 라고 출력하기
  */
  print('ex');

  //1
  List<String> threekingdoms4 = [];

  //2
  threekingdoms4.add('위');   
  threekingdoms4.add('촉');
  threekingdoms4.add('오');
  print(threekingdoms4);

  //3
  threekingdoms4[0] = 'We';
  threekingdoms4[2] = 'Oh';
  print(threekingdoms4);

  //4
  threekingdoms4.remove('We'); //We 삭제
  threekingdoms4.remove('촉'); //촉 삭제
  print(threekingdoms4);
  
  //5
  print("현재 남아 있는 데이터 갯수는 ${threekingdoms4.length} 개 입니다.");
  //6
  print("현재 남아 있는 나라는 ${threekingdoms4[0]} 입니다.");

  
}