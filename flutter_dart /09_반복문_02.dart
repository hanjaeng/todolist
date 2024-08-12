main(){
  // 구구단 5단 출력
  for(int i =1; i<=9; i++){
    print("5 X $i = ${5*i}");
  }

  int dan = 5;                       //데이터로!
  for(int i = 1; i<=9; i++){
    print("$dan X $i = ${dan*i}");
  }

  print('---------');
  print('---------');

  for(int dan = 2; dan<=9; dan++){    //2~9단까지 2중 for
    for(int i = 1; i<=9; i++){
    print("$dan X $i = ${dan*i}");
    }
  }

}//end