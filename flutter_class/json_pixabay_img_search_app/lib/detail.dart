import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.$1),
      ),
      body: Center(
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Colors.amber,
          ),
          imageProvider: NetworkImage(data.$2),
        ),
      ),
    );
  }
}