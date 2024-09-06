import 'package:flutter/material.dart';
import 'package:listview_todo_ex1_app/model/message.dart';
// import 'package:listview_todo_ex1_app/model/practice.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Message.imageName),
            Text(Message.listContent),
            // ElevatedButton(
            //   onPressed: (){},
            //   child: Text('이런')
            // )
          ],
        ),
      ),
    );
  }
}