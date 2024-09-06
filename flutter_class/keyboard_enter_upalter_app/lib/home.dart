import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;


  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Board Enter')
      ),
      body:Center(
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: '글자를 입력 하세요'
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go, //go = enter
          onSubmitted: (value){
            if(textEditingController.text.trim().isEmpty) {
              showSnackBar('경고','글씨를 입력하세요', Colors.red);
            }else{
              showSnackBar('입력완료', "입력한글자는 ${textEditingController.text.trim()} 입니다", Colors.blue);
            }
          },
        ),
      )
    );
  }
  // function
  showSnackBar(title, message, color){
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds:2),
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: color,
    );
    setState(() { });
  }
}