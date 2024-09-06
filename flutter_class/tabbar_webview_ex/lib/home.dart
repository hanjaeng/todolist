import 'package:flutter/material.dart';
import 'package:tabbar_app/webbody.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  // Property
  late TabController controller;
  late String siteName;
  

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();    //controller를 종료하고 앱을 종료시켜야한다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tabbar webview'),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          WebBody(siteName: 'naver'),
          WebBody(siteName: 'google'),
          WebBody(siteName: 'daum'),
          // WebBody(siteName: siteName[0]),
          // WebBody(siteName: siteName[1]),
          // WebBody(siteName: siteName[2]),
        ],
      ),

      
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Image.asset("images/naver.jpeg"),
              text: "naver",
            ),
            Tab(
              icon:Image.asset("images/google.jpeg"),
              text: "google",
            ),
            Tab(
              icon:Image.asset("images/daum.jpeg"),
              text: "daum",
            ),
          ],
          ),
      ),
      
    );
  }
}