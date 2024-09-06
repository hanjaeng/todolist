import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  // Property
  var data = Get.arguments;
  // late String title;
  late String imagePath;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = data.$2;
    imagePath = data.$1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Image.network(data.$1),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(
                        result: textEditingController.text.trim(),
                      );
                    },
                    child: const Text('Edit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'home.dart';

// class Edit extends StatefulWidget {
//   final String data;
//   final int index; 

//   const Edit({super.key, required this.data, required this.index}) ;

//   @override
//   State<Edit> createState() => _EditState();
// }

// @override
// class Message {
//   static String imageName = '';
// }

// class _EditState extends State<Edit> {
//   late TextEditingController textEditingController;


//   @override
//   void initState() {
//     super.initState();
//     textEditingController = TextEditingController();
//     Message.imageName = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit'),
//       ),
//       body: Center(
//           child: Column(
//         children: [
//           Image.asset((widget.data[index],),),
//           TextField(
//             controller: textEditingController,
//             decoration: InputDecoration(labelText: '내용을 입력하세요'),
//           ),
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () => editing(),
//                 child: Text('입력'),
//               ),
//               ElevatedButton(
//                 onPressed: Get.back,
//                 child: Text('취소'),
//               ),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
//   // --function--
//   editing(){
//     if(textEditingController.text.trim().isNotEmpty){
//         =  textEditingController.text.trim();
//       Get.back();
//     }
//     setState((){});
//   }
// }
