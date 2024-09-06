main(){
  checkVersion();
  print('endProcess');
}

Future checkVersion()async{ //async가 있으면 CPU2개동시사용) 뒤부터 실행될 수 있음 
//(Future써도 되고 안써도 됨, 타입이 Future)
  var version = await lookUpVersion(); //async가있으면 await가 있음!
  print(version);
}

int lookUpVersion(){
//(int 써도 되고 안써도 됨, 타입이 int)
  return 12;
}
