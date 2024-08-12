main(){
  //for
  // 1부터 100까지 출력하기

  print(1);
  print(2);
  print(3);
  print(4);

  for(int i = 1; i <= 100; i++){  //1부터, 100보다 작을때까지, i하나씩 증가시키면서
    print(i);
  }


  // 1~10까지의 합계
  int sum = 0;
  for (int i = 1; i <= 10; i++){   
    sum += i;                     //1부터 10까지의 누적합계 누적합(+=) 
  }    
  print(sum);
  
  /*
  1부터 100까지의 수중 짝수의 합과 홀수의 합 구하기
  단, for문의 1개만 사용
  "1부터 100까지의 수중 홀수의 합은 ____이고 짝수의 합은 ____이다."
  */

  int evensum = 0;  //짝수의 합계
  int oddsum = 0;   //홀수의 합계
  for( int i = 1; i <= 100; i++){      //for 작성하면 print 로 제대로 나오는지 확인
  if(i % 2 ==0){
  evensum += i;
  } else{
    oddsum += i; 
  }
  }
  print('1부터 100까지의 수중 홀수의 합은 $oddsum이고 짝수의 합의 $evensum이다.');



  //list를 반복문으로 처리하기
  List<int> numList = [1,3,5,7,9];  //list는 대괄호[]로 데이터가 있어야함
      //List[0] -> 1
      //List[2] -> 5
  
  int sumList = 0;
  for(int i = 0; i < numList.length; i++){  //numList보다 작을때까지 0,1,2,3,4 (5개 여야하므로))
    print(numList[i]);      //-> 1,3,5,7,9
    sumList += numList[i];
  }

  //while
  int number = 1;
  while(number <=10){    //조건이 true인경우 무한반복
    print(number);
    number++;           //10이 될때까지 증가
  }


  // do while
  number = 1;
  do{
    print(number);
    number++;
  } while(number <=10);


  //break, continue
  for(int i=1; i<=10; i++){
    if(i == 5) {                //5 도달하면 종료(5컷)
      break;
    }
    print(i);
    }

  for(int i=1; i<=10; i++){
    if(i == 5) {                //5 빼고 진행(5제거)
      continue;
    }
    print(i);
    }



}//end
