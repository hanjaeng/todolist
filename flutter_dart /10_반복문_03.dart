main(){
  List<String> strs = [];
  strs.add("일요일");
  strs.add("월요일");
  strs.add("화요일");
  strs.add("수요일");
  strs.add("목요일");
  strs.add("금요일");
  strs.add("토요일");

  for(String str in strs){   //데이터는 문자이므로 string 으로 (숫자는 int)
    print(str);
  }

  for(int i=0; i<strs.length; i++){   //int 인덱스 번호대로
    print("strs[$i] : ${strs[i]}");
  }
}