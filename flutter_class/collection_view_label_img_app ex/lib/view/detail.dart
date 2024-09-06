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
  late String heroimage;

  @override
  void initState() {
    super.initState();
    heroName = Get.arguments ?? "__";
    heroimage = Get.arguments ?? "__";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('꽃 상세 보기'),
      ),
      body: Column(
        children: [
          Image.asset(heroimage),
          Text(heroName),]
          )
    );
  }
}