import '16_Class_calc_01.dart';
main(){
  Calc01 calc01 = Calc01.init();   // Calc01(객체, object, instance)와 연결
  int n1 = 10;  // 첫번째 수
  int n2 = 20;  // 두번째 수
//---------------------------
  int resultInt = calc01.addtion(n1, n2);
  print("$n1 + $n2 = $resultInt");
  int nn1 = 10;  int nn2 = 20;
  int resultInt1 = calc01.subtraction(nn1, nn2);
  print("$nn1 - $nn2 = $resultInt1");
  int nnn1 = 10;  int nnn2 = 20;
  int resultInt2 =calc01.mutiplication(nnn1, nnn2);
  print("$nnn1 * $nnn2 = $resultInt2");
  int nnnn1 = 10;  int nnnn2 = 20;
  double resultInt3 =calc01.division(nnnn1, nnnn2);
  print("$nnnn1 / $nnnn2 = $resultInt3");
  print("$nnnn1 / $nnnn2 = ${calc01.division(nnnn1, nnnn2)}");

  print("======간단히=====");
  //------Method 활용--------각자 데이터입력---
  print("$n1 + $n2 = ${calc01.addtion(n1, n2)}");
  print("$n1 - $n2 = ${calc01.subtraction(n1, n2)}");
  print("$n1 * $n2 = ${calc01.mutiplication(n1, n2)}");
  print("$n1 / $n2 = ${calc01.division(n1, n2)}");
  //------Property 활용------property에 입력-----
  print("---------------");
  Calc01 calc02 = Calc01.init();
  calc02.num1 = n1;
  calc02.num2 = n2;
  print("$n1 + $n2 = ${calc02.addProperty()}");
  print("$n1 - $n2 = ${calc02.subProperty()}");
  print("$n1 * $n2 = ${calc02.mutiplProperty()}");
  print("$n1 / $n2 = ${calc02.division(n1, n2)}");
  //------Contructor 활용------contructor에 입력(제일간단)-----
  print("---------------");
  print("Call by Contructor");
  Calc01 calc03 = Calc01(n1, n2);
  print("$n1 + $n2 = ${calc03.addProperty()}");
}