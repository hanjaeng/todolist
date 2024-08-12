main(){
  print("1부터 100까지의 수중 짝수의 합계는 ${rangeSum(1,100,"even")} 입니다");
  print("1부터 100까지의 수중 홀수의 합계는 ${rangeSum(8,800,"odd")} 입니다");
}

int rangeSum(int num1, int num2, String xxx){
  int evensum = 0;
  int oddsum = 0;

  for(int i = num1; i <=num2; i++){
    if(i % 2 == 0){
      evensum += i;
    } else{
      oddsum += i;
    }    
  }
  
  if(xxx == "even"){
    return evensum;
  } else{
    return oddsum;
  }

}
