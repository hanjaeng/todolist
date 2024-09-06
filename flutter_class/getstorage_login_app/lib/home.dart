import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {  //with WidgetsBindingObserver상속시켜야!
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController= TextEditingController();
    

    //초기화
    initStorage();
  }
  initStorage(){
    box.write('p_userId',"");
    box.write('p_password', "");
  }

  @override
  void dispose() {    // 앱 종료했때 정의
    disposeStorage();
    super.dispose();
  }
  disposeStorage(){
    box.erase();    ///////////////
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('log in'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage('images/login.png'), radius: 70),
              TextField(
                controller: userIdController,
                decoration: const InputDecoration(labelText: '사용자 ID를 입력하세요'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: '패스워드를 입력하세요'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (userIdController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    errorSnackBar();
                  } else {
                    _showDialog();
                  }
                },
                child: Text("df "),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //function
  errorSnackBar(){
    Get.snackbar(
      "경고", 
      "사용자 ID와 암호를 입력하세요",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error
    );
  }
  _showDialog(){
    Get.defaultDialog(
      title: '환영합니다',
      middleText: '신분이확인되었습니다',
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: (){
            Get.back();
            saveStorage();        //지우고
            Get.to(
              const Second());  // 세컨으로 간다
          },
          child: Text("Exit"),
        ),
      ]
    );
  }
  saveStorage(){
    box.write('p_userId', userIdController.text.trim());
    box.write('p_password', passwordController.text.trim());

  }
}
