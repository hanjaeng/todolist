import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  //with WidgetsBindingObserver상속시켜야!
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // shared호출(앱 위에서 감시!!)
    WidgetsBinding.instance.addObserver(this); //WidgetsBinding 메모리 상주 프로그램 위젯

    userIdController = TextEditingController();
    passwordController = TextEditingController();

    //Shared Preferences 초기화
    initSharedPreferences();
  }

  initSharedPreferences() async {
    //무조건 async!!
    final prefs = await SharedPreferences.getInstance(); // async 대기한다!
    userIdController.text =
        prefs.getString('p_userId') ?? ""; // 전에 아이디 안지웠으면 표시, 지웠으면 ""
    passwordController.text =
        prefs.getString('p_password') ?? ""; //?? -> null check 연산자

    //메모리에 겨로가 값이 남아 있는지 테스트
    print(userIdController.text);
    print(passwordController.text);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //State상태 가져와 어떤 상태냐
    switch (state) {
      case AppLifecycleState.detached:
        print("detached");
      case AppLifecycleState.resumed:
        print("resume");
      case AppLifecycleState.inactive:
        // disposeSharedPreferences();  //inactive되었을때 종료 되어야함 입력해두었던것들 사라짐
        print("inactive");
      case AppLifecycleState.paused:
        disposeSharedPreferences(); //지우는 함수 만들어줌
        print("paused");
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  disposeSharedPreferences() async {
    // 위에 종료함수만들어줌
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();  // clear는 다 지우기
    prefs.remove('p_password'); //remove 는 해당건만지우기(password만 지우기)
  }

  @override
  void dispose() {
    // 앱 종료했때 정의
    super.dispose();
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
                child: Text("입력"),
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
            saveSharedPredferences();
            Get.to(
              const Second());
          },
          child: Text("Exit"),
        ),
      ]
    );
  }
  saveSharedPredferences()async{
    final prefs = await SharedPreferences.getInstance();  //입력완료되면
    prefs.setString('p_userId', userIdController.text.trim());   //get 가져오는것이고 set은 넣는것!
    prefs.setString('p_password', passwordController.text.trim());
  }
}
