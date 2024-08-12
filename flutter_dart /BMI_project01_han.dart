import 'project01_han_calc.dart';

main(){
  Bmi calc = Bmi();

  double weight= 75.0;
  double height= 1.70;

  calc.num1 = weight;
  calc.num2 = height;

  String BMI = "";

  if(calc.divProperty() <= 18.4){           
    BMI = '저체중';
  }  else if(calc.divProperty() <= 22.9){
    BMI = '정상체중';
  }  else if(calc.divProperty() <= 24.9){
    BMI = '과체중';
  }  else if(calc.divProperty() <= 29.9){
    BMI = '비만';
  }  else{
    BMI = '고도비만';
  }


  print("당신의 BMI는 ${calc.divProperty()}이고 $BMI 입니다.");

}