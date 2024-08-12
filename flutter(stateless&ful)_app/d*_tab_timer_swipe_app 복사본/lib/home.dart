import 'package:ex_tab_app/view/button.dart';
import 'package:ex_tab_app/view/imagetimer.dart';
import 'package:ex_tab_app/view/swipe.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); //순서에 주의
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Three Tabs'),
      // ),
      body: Stack(children: [
        Positioned(
          left: 10,
          top: 50,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.blueAccent,
              width: 6,
            )),
            child: SizedBox(
              height: 750,
              width: 400,
              child: TabBarView(controller: controller, children: [
                Swipe(),
                Button(),
                imageTimer(),
              ]),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        height: 100,
        child: TabBar(
          isScrollable: true,
          padding: EdgeInsets.all(10),
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 10,
          tabs: [
            Tab(
              icon: Icon(Icons.looks_one),
              text: 'One',
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: 'Two',
            ),
            Tab(
              icon: Icon(Icons.looks_3),
              text: 'Three',
            ),
          ],
        ),
      ),
    );
  }
}
