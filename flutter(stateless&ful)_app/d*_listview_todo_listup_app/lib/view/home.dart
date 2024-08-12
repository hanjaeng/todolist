import 'package:flutter/material.dart';

import 'p1.dart';
import 'p2.dart';
import 'p3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //tap bar 넣기 위해 with Single넣기
  //porperty
  late TabController controllertTabBar;
    ThemeMode mode_themeMode = ThemeMode.system;      //모드
  
  mode_changeThemeMode(ThemeMode themeMode){       //함수생성
    mode_themeMode = themeMode;
    setState(() {});
  }
@override
  void initState() {
    super.initState();
    controllertTabBar = TabController(length: 3, vsync: this); //tapbar 3개
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list'),
        actions:[
        IconButton(
            onPressed: () => Navigator.pushNamed(context, '/set'),
            icon: Icon(Icons.settings),),
        ],
        bottom :     
         TabBar(           //텝바  상단 appbar에다가 나오게!
        controller: controllertTabBar,
        tabs: [
          Tab(
            icon: Column(
              children: [
                Icon(
                  Icons.schedule,
                  color: Colors.blue,
                ),
                Text('오늘할일'),
              ],
            ),
          ),
          Tab(
            icon: Column(
              children: [
                Icon(
                  Icons.mobile_friendly,
                  color: Colors.red,
                ),
                Text('암기노트'),
              ],
            ),
          ),
          Tab(
            icon: Column(
              children: [
                Icon(
                  Icons.directions_walk,
                  color: Colors.green,
                ),
                Text('체중관리'),
              ],
            ),
          ),
        ],
      ),
      ),
      body: TabBarView(
        controller: controllertTabBar,
        children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
        ],
      ),
    );
  }
}