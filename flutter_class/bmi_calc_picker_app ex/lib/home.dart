import 'package:bmi_calc_app/vm/exbmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<String> cm;
  late List<String> kg;
  late int selectedCm;
  late int selectedKg;

  @override
  void initState() {
    super.initState();
    cm= ['150','160','170','180'];
    kg= ['10','20','30','40'];
    selectedCm = 0;
    selectedKg = 0;

    result = (0, "", 0.0);
    resultStr = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: false,
          title: const Text('BMI 계산기'),
        ),
        body: Center(
          child: Row(
            children: [
              
              CupertinoPicker(
                itemExtent: 100, 
                onSelectedItemChanged: (value){
                  selectedCm = value;
                  setState((){});
                },
                children: List.generate(
                  10,
                  (index) =>Center(
                    child: Text(cm[index]),
                    )
                  )
                ),

                CupertinoPicker(
                itemExtent: 100, 
                onSelectedItemChanged: (value){
                  selectedCm = value;
                  setState((){});
                },
                children: List.generate(
                  10,
                  (index) =>Center(
                    child: Text(kg[index]),
                    )
                  )
                ),
              

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () => inputCheck(),
                  child: const Text('BMI 계산'),
                ),
              ),
              Text(
                resultStr,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Positioned(
                    left: (result.$3),  // 25, 105, 185, 265, 340
                    child: const Icon(Icons.arrow_downward)
                    ),
                  SizedBox(
                    width: 400,
                    height: 300,
                    child: Image.asset('images/bmi.jpg'),
                  ),
                ],
              )
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
      resultStr = '귀하의 bmi지수는 ${result.$1}이고 ${result.$2}입니다.';

    }
    setState(() {});
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
