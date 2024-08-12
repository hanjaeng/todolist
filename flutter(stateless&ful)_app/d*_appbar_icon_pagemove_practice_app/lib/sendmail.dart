import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Mail'),
        backgroundColor: Colors.green,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('유비에게보낸메일'),
            Text('관주에게보낸메일'),
            Text('장비에게보낸메일'),
          ],
        ),
      ),
    );
  }
}