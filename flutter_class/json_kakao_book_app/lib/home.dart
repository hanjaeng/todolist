import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http; // as http에서 가져왔음으로 표기!!

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late TextEditingController textEditingController;
  late String search_Nm;
  late String searchName;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  getJSONData() async {
    var url = Uri.parse('https://dapi.kakao.com/v3.search/book?target=title&query=코로나19');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('KaKao Book Search'),
      ),
      body: Center(
        child: Column(
          children: [

        data.isEmpty
        ? const CircularProgressIndicator()
                  ]
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: ),
      );
  }
}