import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DetailHero extends StatefulWidget {
  const DetailHero({super.key});

  @override
  State<DetailHero> createState() => _DetailHeroState();
}

class _DetailHeroState extends State<DetailHero> {
  //property
  late String heroName;

  @override
  void initState() {
    super.initState();
    heroName = Get.arguments ?? "__";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인물보기'),
      ),
      body: Center(
        child: Text(heroName),)
    );
  }
}