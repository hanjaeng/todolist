main()async{
  await getVersionName().then((value)=> print(value)); //(return 받아오는 value)
  //async로 순서를 정하는방법!! getVer끝날때가지기다려~
  print("End Process");
}

getVersionName() async{
var versioName = await lookUpVersionName();
return versioName;
}

lookUpVersionName(){
  return 'Flutter';
}