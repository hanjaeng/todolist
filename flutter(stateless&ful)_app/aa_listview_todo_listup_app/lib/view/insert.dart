import 'package:flutter/material.dart';
import 'package:listview_todo_ex1_app/model/message.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

  //Properties
  late List<bool>switchValueList;
  late TextEditingController textEditingController;

  late List<String> imageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchValueList = [];
    switchValueList.add(true);
    switchValueList.add(false);
    switchValueList.add(false);
    imageList = [];
    imageList.add('images/cart.png');
    imageList.add('images/clock.png');
    imageList.add('images/pencil.png');
    textEditingController = TextEditingController();
    Message.imageName = 'images/cart.png';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('구매'),
                Switch(
                  value: switchValueList[0], 
                  onChanged: (value){
                    switchValueList[0] = value;
                    switchChanged(0);
                  }
                ),
                //체크박스로도 대체 가능!!!
                // Checkbox(     
                //   value: switchValueList[0], 
                //   onChanged: (value){
                //     switchValueList[0] = value!;  !넣어야함


                Image.asset(
                  imageList[0]
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('약속'),
                Switch(
                  value: switchValueList[1], 
                  onChanged: (value){
                    switchValueList[1] = value;
                    switchChanged(1);
                  }
                ),
                Image.asset(
                  imageList[1]
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('스터디'),
                Switch(
                  value: switchValueList[2], 
                  onChanged: (value){
                    switchValueList[2] = value;
                    switchChanged(2);
                  }
                ),
                Image.asset(
                  imageList[2]
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '목록을 입력하세요'
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                okButtonPressed();
              }, 
              child: Text('OK')
            ),
          ],
        ),
      ),
    );
  }

  switchChanged(int imageIndex){
    if(switchValueList[imageIndex]){
      for (int i = 0; i<3; i++){
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
      Navigator.pop(context);
    }
    setState((){});
  }


}// End


// import 'package:flutter/material.dart';
// import 'package:listview_todo_ex1_app/model/message.dart';

// class InsertPage extends StatefulWidget {
//   const InsertPage({super.key});

//   @override
//   State<InsertPage> createState() => _InsertPageState();
// }

// class _InsertPageState extends State<InsertPage> {

//   //Properties
//   late List<bool>switchValueList;
//   late TextEditingController textEditingController;

//   late List<String> imageList;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     switchValueList = [];
//     switchValueList.add(true);
//     switchValueList.add(false);
//     switchValueList.add(false);
//     imageList = [];
//     imageList.add('images/cart.png');
//     imageList.add('images/clock.png');
//     imageList.add('images/pencil.png');
//     textEditingController = TextEditingController();
//     Message.imageName = 'images/cart.png';
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Insert View'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('구매'),
//                 Checkbox(
//                   value: switchValueList[0], 
//                   onChanged: (value){
//                     switchValueList[0] = value!;
//                     switchChanged(0);
//                   }
//                 ),
//                 Image.asset(
//                   imageList[0]
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('약속'),
//                 Checkbox(
//                   value: switchValueList[1], 
//                   onChanged: (value){
//                     switchValueList[1] = value!;
//                     switchChanged(1);
//                   }
//                 ),
//                 Image.asset(
//                   imageList[1]
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('스터디'),
//                 Checkbox(
//                   value: switchValueList[2], 
//                   onChanged: (value){
//                     switchValueList[2] = value!;
//                     switchChanged(2);
//                   }
//                 ),
//                 Image.asset(
//                   imageList[2]
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextField(
//                 controller: textEditingController,
//                 decoration: InputDecoration(
//                   labelText: '목록을 입력하세요'
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: (){
//                 okButtonPressed();
//               }, 
//               child: Text('OK')
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   switchChanged(int imageIndex){
//     if(switchValueList[imageIndex]){
//       for (int i = 0; i<3; i++){
//         if (i == imageIndex){
//           switchValueList[i] = true;
//           Message.imageName = imageList[i];
//         }else{
//           switchValueList[i] = false;
//         }
//       }
//     }else{
//       switchValueList[imageIndex] = false;
//       switchValueList[0] = true;
//       Message.imageName = imageList[0];
//     }
//       setState(() {});
//   }


//   okButtonPressed(){
//     if(textEditingController.text.trim().isNotEmpty){
//       Message.listContent =  textEditingController.text.trim();
//       Message.isadd = true;
//       Navigator.pop(context);
//     }
//     setState((){});
//   }


// }// End