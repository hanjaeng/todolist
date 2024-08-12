main(){
  int dan =2;                 // dan 정의
  for(int i=1; i<=9; i++){    // i를 이용하겠다
    print(i);
    print("$dan X $i = ${dan * i}");       // $붙여 데이터를 불러와서 결과물 찍기
  }


  print("---------------");
  guguDan(2);
  guguDan(5);

}
void guguDan(int dan){         // return 할 필요가 없을경우 void 붙인다
  print(">>> $dan단 <<<");
  for(int i=1; i<=9; i++){    // i를 이용하겠다
    print("$dan X $i = ${dan * i}");       // $붙여 데이터를 불러와서 결과물 찍기
  }
}