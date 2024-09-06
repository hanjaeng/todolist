import '17_B_add.dart';

main(){
  //결과 값을 변수로 받는다.
  (int, int) result;
  AddSub addSub = AddSub(num1:10, num2:20);
  result = addSub.addSubAction();
  print("${result.$1}, ${result.$2}");
}

class AddSub{             //b 여기에 정보를 넘겨줌
  late int num1;
  late int num2;

  AddSub({int? num1, int? num2}){  //a생성자가
    this.num1 = num1!;
    this.num2 = num2!;
  }

  addAction(){
    return num1 + num2;  
  }

  subAction(){
    return num1 - num2;
  }

  addSubAction(){
    return(addAction(),subAction());
  }

}
