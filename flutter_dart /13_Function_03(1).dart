main(){
  print("1부터 100까지의 수중 짝수의 합계는 ${rangeSum(1,100,"even")} 입니다");
  print("1부터 100까지의 수중 홀수의 합계는 ${rangeSum(8,800,"odd")} 입니다");
}

int rangeSum(int num1, int num2, String xxx){
  int sum = 0;
  if(xxx == 'even'){
    for(int i = num1; i<=num2; i++){
      sum = i % 2 == 0 ? sum + i : sum;
    }
  } else if(num1 == 'odd'){
    for(int i = num1; i<=num2; i++){
      sum = i % 2 == 1 ? sum + i : sum;
    }
  }
  return sum;
}