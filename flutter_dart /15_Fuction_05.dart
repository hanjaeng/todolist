main(){
  List<int> list1 = [1,3,5,7,9];
  List<int> list2 = [10,30,50,70,90];

  print(addList(list1));   // 작동
  print(addList(list2));
}


int addList(List list){    // 함수
  int sum = 0;
  for(int i in list){  // 1시작 list수로 돌리기
    sum += i;
  }
  return sum; 


  
}


