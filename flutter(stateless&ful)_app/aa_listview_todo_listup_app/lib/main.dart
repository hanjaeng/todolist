import 'package:flutter/material.dart';
import 'package:listview_todo_ex1_app/view/detail.dart';
import 'package:listview_todo_ex1_app/view/home.dart';
import 'package:listview_todo_ex1_app/view/insert.dart';
import 'package:listview_todo_ex1_app/view/table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    routes: {
      '/home' : (context) => const Home(),
      '/' : (context) => const TablePage(),
      '/insert' : (context) => const InsertPage(),
      '/detail' : (context) => const DetailPage(),
    },
    initialRoute: '/',
    );
  }
}
