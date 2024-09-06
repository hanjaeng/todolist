import 'package:flutter/material.dart';

class LandscapeMode extends StatefulWidget {
  const LandscapeMode({super.key});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text('Ladscape Mode')),
    );
} }