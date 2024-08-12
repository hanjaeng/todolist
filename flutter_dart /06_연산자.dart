main(){  // 연산자  // 자동 증감 연산자
  int num = 0;
  print(num);
  num = num +1;
  num += 1;      //(+)을 누적시킨다
  num++;         //(1)씩만 증가한다
  print(num);
  num = num - 1 ;
  num -=1;
  num--;
  print(num);

  //Optional : Null Safety
  int num1 = 10;           //num1 = null;
  int? num2 = null;        //(?)가 들어가야 null데이터가 옴
  print(num2);

  num2 ??= 10;   //?? 데이터가 없으면 10을 불러오겠다
  print(num2);

  //조건 연산자      true, false로 응답
  int num5 = 10;
  int num6 = 5;
  print(num5 < num6);  // num5가  num6보다 작니?
  print(num5 > num6); 
  print(num5 <= num6);  //=<(x)
  print(num5 >= num6);  //=>(x)
  print(num5 == num6);  //같니?
  print(num5 != num6);  //다르니?
  
  // 논리 연산자 &&(and), ||(or)      bool연산자가 True False 불러움 
  bool result1 = 12 > 10 && 1 > 0;   // &&조건은 둘다 True, True 경우만 True
  print(result1);
  bool result2 = 10 > 5 || 1 > 2;   // ||조건은 TT->T, TF->T, FF->F
  print(result2);



}