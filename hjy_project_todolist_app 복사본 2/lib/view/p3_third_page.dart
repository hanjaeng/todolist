import 'package:flutter/material.dart';

import '../model/exbmi.dart';

// import 'package:intl/intl.dart';

class ThirdPage extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; //onchangeTheme 테마모드 갖고오기 설정!!!
  const ThirdPage({super.key, required this.onchageTheme});
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController num3Controller;
  late TextEditingController num4Controller;
  late TextEditingController num5Controller;
  late TextEditingController num6Controller;
  late TextEditingController num7Controller;
  late (double, String, double) result;
  late String resultStr;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    num3Controller = TextEditingController();
    num4Controller = TextEditingController();
    num5Controller = TextEditingController();
    num6Controller = TextEditingController();
    num7Controller = TextEditingController();
    result = (0, "", 0.0);
    resultStr = '';
  }

  @override
  // final now = new DateTime.now();
  // String formattedDate = DateFormat('yy.MM.dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: ' 키(cm)',
                          ),
                          controller: num1Controller,
                          keyboardType: TextInputType.number,
                        ),
                        width: 65),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: TextField(
                          controller: num2Controller,
                          decoration: const InputDecoration(
                            labelText: '체중(kg)',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        width: 65),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: TextField(
                          controller: num3Controller,
                          decoration: const InputDecoration(
                            labelText: '혈당',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        width: 65),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: TextField(
                          controller: num4Controller,
                          decoration: const InputDecoration(
                            labelText: '혈압',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        width: 65),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                        child: Container(
                            child: TextField(
                              controller: num5Controller,
                              decoration: const InputDecoration(
                                labelText: '아침',
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            width: 150),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                        child: Container(
                            child: TextField(
                              controller: num6Controller,
                              decoration: const InputDecoration(
                                labelText: '점심',
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            width: 150),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                        child: Container(
                            child: TextField(
                              controller: num7Controller,
                              decoration: const InputDecoration(
                                labelText: '저녁',
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            width: 150),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () => inputCheck(),
                          child: const Text('입력'),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Divider(
                height: 50,
                thickness: 1.5,
              ),
              Text(
                resultStr,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputCheck() {
    ExBmi exbmi = ExBmi.init();

    exbmi.height = double.parse(num1Controller.text);
    exbmi.weight = double.parse(num2Controller.text);
    if (num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty) {
      errorSnackBar();
    } else {
      result = exbmi.getResult();
      //[$formattedDate] 
      resultStr =
          '     ${num2Controller.text}kg(${result.$1}), 혈당${num3Controller.text}, 혈압 ${num4Controller.text} \n ';
    }
    setState(() {});
  }

//${result.$2},
//     식사: ${num4Controller.text}, ${num5Controller.text}, ${num6Controller.text}'
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
    setState(() {});
  }
}
