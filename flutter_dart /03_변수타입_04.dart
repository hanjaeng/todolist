main(){
  // var와 Dynamic
    var name = '유비';
  name = '관우';// name 의 추론결과는 문자열로 선언되었으면 숫자데이터를 사용할 수 없음 

  dynamic name1 = '장비'; // dynamic선언은 문자 숫자 함께 쓸수 있지만 혼동되므로 안쓰는게 좋음 
  name1= '조자룡';
  name1= 10;  // 마지막 데이터로 대체됨 '조자룡-->10'
}