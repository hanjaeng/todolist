/*
  - 중복되는 기능제거
  - 소스를 유지 보수 관리가 되게 만들기
*/

main(){ 
  //1부터 10까지 더하기
  int sum = 0;
  for(int i= 0; i<=10; i++){
    sum += i;
  }
    print(sum);

  //1부터 100까지 더하기
  sum = 0;                        //sum 초기화하
  for(int i= 0; i<=100; i++){
    sum += i;
  }
    print(sum);

  //10부터 90까지 더하기
  sum = 0;                        //sum 초기화하
  for(int i= 10; i<=90; i++){
    sum += i;
  }
    print(sum);

print('----------------------------------');
  int addSum(num1, num2){    //for를 하나만써서
    int sum = 0;
    for(int i=num1; i <=num2; i++){
      sum += i;
  }
    return sum;              //return값의 타입을 정해줌
  }
  print(addSum(1, 10));      //addSum Num1,2 지정
  print(addSum(1, 100));      //addSum Num1,2 지정
  print(addSum(10, 90));      //addSum Num1,2 지정

print('----------------------------------');
  /*
  addSum2(1,10,2)
  addSum2(1,10,5)
  addSum2(0,100,5)
  */
int addSum2(int startNum, int endNum, int stepNum){    //()안 int써도 되고 안써도 되고
    int sum = 0;
    for(int i=startNum; i <=endNum; i=i+stepNum){
      sum += i;
    }
    return sum;
  }
  print(addSum2(1,10,2));
  print(addSum2(1,10,5));
  print(addSum2(0,100,5));


}