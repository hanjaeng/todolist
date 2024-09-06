import 'dart:convert';

main(){
  var jsonString = '''
  [
    {"score" : 40},
    {"score" : 80}
  ]
''';
var scores =jsonDecode(jsonString);  
//jsonDecodesms: 문자열(scores)을 dynamic타입으로 바꿈!
//(json 구성은 문자도있고 아닌것도 있을 수 있으므로)
print(scores);

var firstScore = scores[0];
print(firstScore);
print(firstScore['score']);

var fffirstScore = scores[1];
print(fffirstScore);
print(fffirstScore['score']);
}