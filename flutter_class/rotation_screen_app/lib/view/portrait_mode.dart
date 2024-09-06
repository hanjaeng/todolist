import 'package:flutter/material.dart';

class PortraitMode extends StatefulWidget {
  const PortraitMode({super.key});

  @override
  State<PortraitMode> createState() => _PortraitModeState();
}

class _PortraitModeState extends State<PortraitMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(                  //Portrait는 Stack 또는 Colume으로 감싸줘야함
        children: [
          Center(
            child: Text('Portrait Mode')),
        ]),
      );
  }
}