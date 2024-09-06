import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  //Properties
  late TextEditingController textEditingController;
  late List<String> imageName;
  late int selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = [
      'cart.png',
      'clock.png',
      'pencil.png',
    ];
    textEditingController = TextEditingController();
    selectedItem = 0;
    Message.imagePath = 'cart.png';
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'images/${imageName[selectedItem]}',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CupertinoPicker(
                        backgroundColor: Colors.amber,
                        itemExtent: 100, //picker 그림 크기
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          selectedItem = value;
                          setState(() {});
                        },
                        children: List.generate(
                          3, // length,
                          (index) => Center(
                              child: Image.asset(
                            "images/${imageName[index]}",
                            width: 100,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(labelText: '목록을 입력하세요'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.trim().isNotEmpty) {
                        okButtonPressed;
                      }
                      Navigator.pop(context);
                    },
                    child: Text('OK')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  okButtonPressed(index) {
    Message.imagePath = "images/${imageName[index]}";
    Message.workList = textEditingController.text.trim();
    Message.action = true;
    // Navigator.pop(context);
  }
}
