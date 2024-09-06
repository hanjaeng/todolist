import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/vm/database_handler.dart';

class InsertStudents extends StatefulWidget {
  const InsertStudents({super.key});

  @override
  State<InsertStudents> createState() => _InsertStudentsState();
}

class _InsertStudentsState extends State<InsertStudents> {
  //property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  DatabaseHandler handler = DatabaseHandler(); // 모델 만듦(instrokcher)

@override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert for SQlite'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: '학번을 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름을 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호를 입력하세요',
                ),
              ),
            ),
            ElevatedButton(    //데이터베이스 들어가게 하기->database_handler
              onPressed: ()async{  
                Students students = Students(         //실행하면 코드값을 생성하여 
                  code: codeController.text.trim(), 
                  name: nameController.text.trim(), 
                  dept: deptController.text.trim(), 
                  phone: phoneController.text.trim(),
                );
                int result = await handler.insertStudents(students);  
                //database_handler클래스의 insertStudets의 코드를 갖고옴(주고 받고 함)
                if(result == 0){       //database_handler클래스의 result값
                  errorSnackBar();
                } else{
                  showDialog();
                }
              }, 
              child: const Text('입력'),
            )
          ],
        ),
      )

    );
  }
  errorSnackBar(){
    Get.snackbar(
      "경고", 
      "입력중 문제가 발생하였습니다.",
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error
      );
  }
  showDialog(){
    Get.defaultDialog(
      title: '입력 결과',
      middleText: '입력이 완료 되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: (){
            Get.back();
            Get.back();
          },
          child: const Text('OK'),
        )
      ]
    );
  }
}