import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertPage extends StatefulWidget {
    final Function(ThemeMode) onchageTheme; //onchangeTheme 테마모드 갖고오기 설정!!!
  const InsertPage({super.key, required this.onchageTheme});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  //properties
  late List<bool>switchValueList;
  late TextEditingController textEditingController;
  late List<String> imageList;
  // late int radioValue;

@override
  void initState() {
    super.initState();
    switchValueList = [];
    switchValueList.add(true);
    switchValueList.add(false);
    switchValueList.add(false);
    switchValueList.add(false);
    imageList=[];
    imageList.add('images/img_time.png');
    imageList.add('images/img_shopping.png');
    imageList.add('images/img_check.png');
    imageList.add('images/img_memo.png');
    
    textEditingController = TextEditingController();
    Message.imageName = 'images/img_time.png';
    
    // radioValue = 1;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('to do list 추가하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageList[0], width:80),
                    Checkbox(
                      value: switchValueList[0], 
                      onChanged: (value){
                        switchValueList[0] = value!;
                        switchChanged(0);
                      }
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(imageList[1], width:80),
                    Checkbox(
                      value: switchValueList[1], 
                      onChanged: (value){
                        switchValueList[1] = value!;
                        switchChanged(1);
                      }
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(imageList[2], width:75),
                    Checkbox(
                      value: switchValueList[2], 
                      onChanged: (value){
                        switchValueList[2] = value!;
                        switchChanged(2);
                      }
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(imageList[3], width:81),
                    Checkbox(
                      value: switchValueList[3], 
                      onChanged: (value){
                        switchValueList[3] = value!;
                        switchChanged(3);
                      }
                    ),
                  ],
                ),
              ],
            ),
            TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '목록을 입력하세요'
                ),
              ),
            
            ElevatedButton(
              onPressed: (){
              okButtonPressed();
              }, 
              child: Text('입력')
            ),
                    
          ],
        ),
      )
    );
  }
  switchChanged(int imageIndex){
    if(switchValueList[imageIndex]){
      for (int i = 0; i<4; i++){
        if (i == imageIndex){
          switchValueList[i] = true;
          Message.imageName = imageList[i];
        }else{
          switchValueList[i] = false;
        }
      }
    }else{
      switchValueList[imageIndex] = false;
      switchValueList[0] = true;
      Message.imageName = imageList[0];
    }
      setState(() {});
  }

  okButtonPressed(){
    if(textEditingController.text.trim().isNotEmpty){
      Message.listContent =  textEditingController.text.trim();
      Message.isadd = true;
      Navigator.of(context).pop();
      // Navigator.pop(context);
    }
    setState((){});
  }

}