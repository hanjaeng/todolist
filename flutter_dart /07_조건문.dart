main(){
  // 조건문
  int num1 = 5;   // 데이터 지정.
  // 입력된 num1이 10보다 큰수 인지 작은수 인지 같으수 인지 판단
  if(num1 > 10){   //10보다 크면 처리하고, 작으면 종료            
    print('입력된 숫자 $num1은 10보다 큰 수 입니다.');
  } else if(num1 < 10){   //if를 붙여야 ()가능
    print('입력된 숫자 $num1은 10보다 작은 수 입니다');
  } else{  //기타등등.. else는 맨 마지막에! if 안붙이면 ()불가
    print('입력된 숫자 $num1은 10보다 작거나 같은 수 입니다.');
  } print("--- End ---");
  /*  EX :num2에 있는 숫자값을 비교해서
  숫자가 5의 배수 이면 '입력된 숫자 __는 5의 배수 입니다.'
  숫자가 5의 배수가 아니면 '입력된 숫자 __는 5의 배수가 아닙니다.'
  */
  int num2 = 14;
  if (num2 % 5 == 0){
    print('입력된 숫자 $num2는 5의 배수 입니다.');
  } else{
    print('입력된 숫자 $num2는 5의 배수가 아닙니다');
  }
  /* EX:num2가 2의 배수이면'2의 배수입니다.'
  num2가 3의 배수이면'3의 배수입니다.'  num2가 5의 배수이면'5의 배수입니다.'
  위의 3가지 2조건이 아니면 '2,3'5의 배수가 아닙니다.'
  */
  if (num2 % 2 == 0){
    print('2의 배수입니다.');
  } else if(num2 % 3 == 0){
    print('3의 배수입니다.');
  } else if(num2 % 5 == 0){
    print('5의 배수입니다.');
  } else {
    print('2,3,5의 배수가 아닙니다');
  }
  String result = "";  //출력 결과값 보관
  if (num2 % 2 == 0){
    result = '2의 배수입니다.';
  } else if(num2 % 3 == 0){
    result = '3의 배수입니다.';
  } else if(num2 % 5 == 0){
    result = '5의 배수입니다.';
  } else {
    result = '2,3,5의 배수가 아닙니다.';
  }
    print(result); //출력




  //----------
  /*
  Ex:
  점수를 입력받아 학점으로 표시하기
  90점 이상 -> A
  80점 이상 -> B
  70점 이상 -> C
  60점 이상 -> D
  60점 미만 -> F
  */
  int score = 85;
  String grade = "";
  if(score > 100 || score < 0){ // 체크!! 입력 점수 문제 있는지 없는지 확인(100이상 0미만 확인)
    print('입력에 문제가 있습니다');
  } else {
    if(score >= 90){            // 노멀!! 입력에 문제가 없는 경우
    grade = 'A';
    }  else if(score >= 80){
    grade  = 'B';
    }  else if(score >= 70){
    grade  = 'C';
    }  else if(score >= 60){
    grade  = 'D';
    }  else{
    grade  = 'F';
    }
    print("$grade 학점 입니다.");
  }
  print("--------------");
  
  // Switch Case
  // 어떤수가 5의 배수인지?
  num2 = 4;
  switch(num2 % 5){
    case 0:
      print("입려된 숫자 $num2는 5의 배수입니다.");  //버번이 올락가면서 break 생략 가능
    default:
      print("입력된 숫자 $num2는 5의 배수가 아닙니다");
  }

  // 삼항 연산자
  String result2 = num2 % 5 == 0 ? "5의 배수" : "5의 배수 아님";
  print(result2);

} //END


