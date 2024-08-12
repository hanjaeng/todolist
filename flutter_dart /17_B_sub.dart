import '17_B_add.dart';    //class extend add 치면 연결 생성

class Sub extends Add{
  Sub(super.num1, super.num2);
  int subtraction() {
    return num1 - num2;
  }
  
}