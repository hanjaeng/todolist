main(){
  AddSub addSub = AddSub(10,20);
  print("덧셈 : ${addSub.addAction()}");
  print("뺄셈 : ${addSub.subAction()}");
  print("덧셈과 뺄셈: ${addSub.addSubAction()}");
  print("==============");
  (int, int) result = addSub.addSubAction(); //Tuple 정의  int에 지수, int넘버 적으면 2개가 동시에 나옴
  print("${result.$1},${result.$2}");
}

class AddSub{
  late int num1;
  late int num2;

  AddSub(int n1, int n2) {
    this.num1 = n1;
    this.num2 = n2;
  }

  addAction() {
    return num1 + num2;
  }

  subAction() {
    return num1 - num2;
  }
  addSubAction() {
    return (addAction(), subAction()); 
  }
}