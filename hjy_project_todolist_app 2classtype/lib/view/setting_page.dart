import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; //FirstPage의 onchangeTheme 테마모드 갖고오기 설정!!!
  const SettingPage({super.key, required this.onchageTheme});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Color Theme 설정')
        ),

      body: 
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                onPressed: () {
                  widget.onchageTheme(ThemeMode.dark);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Text('Dark Theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onchageTheme(ThemeMode.light);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Theme.of(context).colorScheme.onTertiary,
                ),
                child: Text('Light Theme'),
              ),
                ],
              ),
            ),
    );
}}