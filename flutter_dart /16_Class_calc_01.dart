// Method만으로 구동되는 Class
class Calc01{
  // property(attribute, Field)
  late int num1;   // late는 현재는 없지만 나중에 데이터 들어갈꺼야 표기
  late int num2;

  // constructor
  Calc01.init();

  Calc01(int num1, int num2)
  : this.num1 = num1,
    this.num2 = num2;

  // Method
  int addtion(int num1, int num2){
    return num1 + num2;
  }
  int subtraction(num11, num22){
    return num11 - num22;
  }
  int mutiplication(num111, num222){
    return num111 * num222;
  }
  double division(num1111, num2222){
    return num1111 / num2222;
  }

  //-----------------
  int addProperty(){
    return num1 + num2;  //property사용
  }
  int subProperty(){
    return num1 * num2;  //property사용
  }
  int mutiplProperty(){
    return num1 * num2;  //property사용
  }
  double divProperty(){
    return num1 / num2;  //property사용
  }
  }
