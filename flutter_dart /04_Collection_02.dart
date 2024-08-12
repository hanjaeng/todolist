main(){
  // Collection
  // Map : Key와 Value로 구성된 Collection  (key는 apple, value는 사과 ... ...)
  Map fruits = {'apple' : '사과', 'grape' : '포도', 'watermaelon': '수박'}; 
  print(fruits);

  //데이터 불러오기 
  print(fruits['apple']);

  //데이터 수정하기 (key값 수정 아님)
  fruits['watermelon']= '시원한 수박';
  print(fruits);

  //데이터 추가하기
  fruits['banana'] = '바나나';
  print(fruits);

  /*
    fruitsPrice라는 Map을 작성하는데 
    Key는 String으로 
    Value는 int로 사용하여
    'apple' : 1000, 'grape' : 2000, 'watermelon' : 3000인 데이터로 구성하시오
  */

  Map<String, int> fruitsPrice = {'apple' : 1000, 'grape' : 2000, 'watermelon' : 3000};
  print(fruitsPrice);
  
  // apple과 grape와 watermelon의 합계는?  (! 붙여서 에러풀어주기(옵셔널리타입))
  print(fruitsPrice['apple']! + fruitsPrice['grape']! + fruitsPrice['watermelon']!); //!는 옵셔널리타입 해제

  // apple 2개와 watermelon 1개의 합계는?
  print(fruitsPrice['apple']! * 2 + fruitsPrice['watermelon']!);

  // Map을 선언하고 데이터 넣기
  Map carMakers = {};
  carMakers.addAll({'hyundai': '현대자동차', 'kia': '기아자동차'});
  print(carMakers);
  }
