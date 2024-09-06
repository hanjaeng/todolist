import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReceivedMail'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('유비에게받은메일'),
            Text('관주에게받은메일'),
            Text('장비에게받은메일'),
          ],
        ),
      ),
    );
  }
}