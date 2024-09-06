import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime date;
  late String selectDateText;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    selectDateText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "현재 일자 : ${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, "0")}입니다."), //.toString().padLeft()
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () => dispDatePicker(),
                  child: const Text('Date Picker')),
            ),
            Text(selectDateText)
          ],
        ),
      ),
    );
  }

  // --- Functions ---

  dispDatePicker() async {
    int firstYear = date.year - 1;
    int lastYear = date.year + 5;
    final selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(firstYear),
        lastDate: DateTime(lastYear),
        initialDate: date,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        locale: const Locale('ko', "KR"));

    if(selectedDate != null){
      selectDateText = "선택하신 일자는 ${selectedDate.toString().substring(0, 10)} 입니다.";
    }else{
      selectDateText = "";
    }
    setState(() {});
  }
}
