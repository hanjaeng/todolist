import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> items;
  late String dropdownValue;
  late String imageName;

  @override
  void initState() {
    super.initState();
    items = ['Apple', 'Banana', 'Grape', 'Orange', 'Pineapple', 'Watermelon'];
    dropdownValue = 'Apple';
    imageName = 'Apple';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DropDown Button')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DropdownButton(
              dropdownColor: Theme.of(context).colorScheme.primaryContainer,
              iconEnabledColor: Theme.of(context).colorScheme.secondary,
              value: dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                dropdownValue = value!;
                imageName = value;
                setState(() {});
              },),
              Image.asset("images/$imageName.png"),
        ]),
      ),
    );
  }
}
