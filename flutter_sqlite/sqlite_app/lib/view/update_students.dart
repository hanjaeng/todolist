import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/vm/database_handler.dart';

class UpdateStudents extends StatefulWidget {
  const UpdateStudents({super.key});

  @override
  State<UpdateStudents> createState() => _UpdateStudentsState();
}

class _UpdateStudentsState extends State<UpdateStudents> {
  DatabaseHandler handler = DatabaseHandler();
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  var value = Get.arguments ?? "__";

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();  
    //=codeController = TextEditingController(text: value[0])
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    codeController.text = value[0];
    nameController.text = value[1];
    deptController.text = value[2];
    phoneController.text = value[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update for SQlite'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: '학번',
                ),
                readOnly: true, //학번은 수정 못하게
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름을 수정하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 수정하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호를 수정하세요',
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(    //데이터베이스 들어가게 하기->database_handler
                  onPressed: ()async{  
                    Students students = Students(         //실행하면 코드값을 생성하여 
                      code: codeController.text.trim(), 
                      name: nameController.text.trim(), 
                      dept: deptController.text.trim(), 
                      phone: phoneController.text.trim(),
                    );
                    int result = await handler.updateStudents(students);  
                    //database_handler클래스의 insertStudets의 코드를 갖고옴(주고 받고 함)
                    if(result == 0){       //database_handler클래스의 result값  //0이면 에러
                      errorSnackBar();    //!!!()타입명 넣고 함수에서 지정할수 있음!!!!
                    } else{
                      showDialog();
                    }
                  }, 
                  child: const Text('수정'),
                ),

                ElevatedButton(    //데이터베이스 들어가게 하기->database_handler
                  onPressed: ()async{  
                    int result = await handler.delStudents(codeController.text.trim());  
                     //database_handler클래스의 insertStudets의 코드를 갖고옴(주고 받고 함)
                    if(result == 0){       //database_handler클래스의 result값  //0이면 에러
                    delerrorSnackBar();
                    } else{
                    delshowDialog();
                  }
                }, 
                child: const Text('삭제'),
            ),
              ],
            ),
          ],
        ),
      ),

    );
  }
  errorSnackBar(){    //errorSnackBar(String type)으로 고칠 수 있음
    Get.snackbar(
      "경고", 
      "수정중 문제가 발생하였습니다.", //$type중 문제가 발생.. 으로 고칠 수 있음
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error
      );
  }
  showDialog(){
    Get.defaultDialog(
      title: '수정 결과',
      middleText: '수정이 완료 되었습니다.',
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


  delerrorSnackBar(){
    Get.snackbar(
      "경고", 
      "삭제중 문제가 발생하였습니다.",
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error
      );
  }
  delshowDialog(){
    Get.defaultDialog(
      title: '삭제 결과',
      middleText: '삭제가 완료 되었습니다.',
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