import 'package:flutter/material.dart';

import 'home.dart';
import 'receivedmail.dart';
import 'sendmail.dart';

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
      // home: const Home(),
      routes:{ 
        '/':(context) => const Home(),
        '/send':(context) => const SendMail(),
        '/receive': (context) => const ReceivedMail(),
      }
    );
  }
}
