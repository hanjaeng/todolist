/*
  변수명 선언
  - 첫글자는 영문으로 작성
  - 변수명은 의미있는 2영어단어 조합으로 -> 나중에 시스템과 에러 안남
  - 1) Camerl 기법: 2단어 조합시 두번째 글자는 대문자로 작성
    ex) applefruit -> appleFruit
  - 2) Snake 기법: 2단어 조합시 두번째 글자전에 underbar로 연결
    ex) applefruit -> apple_fruit

*/

main(){
  

  // 변수 타입 선언자   -> 선언자를 앞쪽으로 모아야 보기 좋음
  
  // 정수
  int intNum1 = 30;  //inNum을 입력해야 변수가 정수 명임을 알 수 있음
  int intNum2 = 20;
  
  int addResult = 0; // 덧셈 결과 변수로 저장
  int subResult = 0; 
  int mulResult = 0; 
  double divResult = 0; // 나눗셈은 정수가 아니므로 실수타입 선언자로 'int'->'double'로 변경해야 함
  int remainResult = 0; 
  int quotientResult = 0; // 나눗셈 몫 결과 변수로 저장

  // 실수
  double doubleNum1 = 1.5;
  double doubleNum2 = 0.2;


  // 사칙연산
  print("** 정수 사칙연산 **"); // print --> 출력만 되고 저장은 안된다
  // print(intNum1 + intNum2); // 덧셈 -> 타입 정수
  // print(intNum1 - intNum2); // 뺄셈 -> 타입 정수 
  // print(intNum1 * intNum2); // 곱셈 -> 타입 정수
  // print(intNum1 / intNum2); // 실수 나눗셈
  // print(intNum1 % intNum2); // 나눗셈 남머지
  // print(intNum1 ~/ intNum2); // 나눗셈 몫

  addResult = intNum1 + intNum2; // 덧셈 결과 변수로 저장
  subResult = intNum1 - intNum2; 
  mulResult = intNum1 * intNum2; 
  divResult = intNum1 / intNum2; // 나눗셈은 정수가 아니므로 실수타입 'int'->'double'로 변경해야 함
  remainResult = intNum1 % intNum2; 
  quotientResult = intNum1 ~/ intNum2; 





  print(doubleNum1 + doubleNum2);
  print(doubleNum1 - doubleNum2);
  print(doubleNum1 * doubleNum2);
  print(doubleNum1 / doubleNum2);
  print(doubleNum1 % doubleNum2);
  print(doubleNum1 ~/ doubleNum2);
}