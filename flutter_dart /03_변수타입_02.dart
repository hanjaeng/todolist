main(){
  // 문자열
  String str1 = '유비'; 
  String str2 = '장비';

  // 문자열 연결 방식으로 출력
  print(str1 + " : " + str2);

  // 문자열 보간법
  print("$str1 : $str2");  //$표시를 넣으면 변수를 집어넣을 수 있음




  // 정수의 문자열 보간법
  int intNum1 = 170;
  int intNum2 = 70;

  // intNum1과 intNum2의 합은 240 입니다.
  print("intNum1과 intNum2의 합은 ${intNum1 + intNum2} 입니다");  //$로 변수 불러와서 중괄호{}로 묶어주기

  // 170 + 70 = 240
  print("$intNum1 + $intNum2 = ${intNum1+intNum2}");


}