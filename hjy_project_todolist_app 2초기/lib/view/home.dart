import 'package:flutter/material.dart';
import 'package:hjy_project_todolist_app/%08view/p1_first_page.dart';
import 'package:hjy_project_todolist_app/%08view/p2_second_page.dart';
import 'package:hjy_project_todolist_app/%08view/p3_third_page.dart';

import '../model/list.dart';

class Home extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; //home의 onchangeTheme 테마모드 갖고오기 설정!!!
  const Home({super.key, required this.onchageTheme});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //tap bar 넣기 위해 with Single넣기
  //porperty
  late TabController controllertTabBar;
  ThemeMode mode_themeMode = ThemeMode.system;      //모드
  late List<TodoList> todoList;  //**추가

  mode_changeThemeMode(ThemeMode themeMode){       //함수생성
    mode_themeMode = themeMode;
    setState(() {});
  }
@override
  void initState() {
    super.initState();
    controllertTabBar = TabController(length: 3, vsync: this); //tapbar 3개
    todoList=[];
    todoList.add(TodoList(imageName: ' ', listContent: ' '));
    
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
                Text('암기장'),
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
                Text('헬스케어'),
              ],
            ),
          ),
        ],
      ),
      ),
      body: TabBarView(
        controller: controllertTabBar,
        children: [  //todolistR: todoList, 
              FirstPage(onchageTheme: mode_changeThemeMode),
              SecondPage(onchageTheme: mode_changeThemeMode),
              ThirdPage(onchageTheme: mode_changeThemeMode),
        ],
      ),
    );
  }
}