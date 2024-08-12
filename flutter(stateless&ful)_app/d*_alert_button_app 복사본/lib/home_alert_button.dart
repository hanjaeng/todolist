import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage;
  late double _lampWidth;
  late double _lampHeight;
  late bool _lampState;

  @override
  void initState() {
    super.initState();
    _lampState = true;
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 300;
    _lampHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
      ),
      body: Column(
        children: [
          Text('$_lampState'),
          Image.asset(
            _lampImage,
            width: _lampWidth,
            height: _lampHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  onLamp(context),
                  // setLampState(),
                },
                child: Text('켜기'),
              ),
              ElevatedButton(
                onPressed: () => {
                  offLamp(context),
                },
                child: Text('끄기'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  setLampState() {
    if (_lampState) {
      _lampState = false;
      _lampImage = 'images/lamp_off.png';
    } else {
      _lampState = true;
      _lampImage = 'images/lamp_on.png';
    }
    setState(() {});
  }

  offLamp(context) {
    if (_lampImage == 'images/lamp_on.png') {
      _showoffDialog(context);
    } else {
      _offDialog(context);
    }
    setState(() {});
  }

  onLamp(context) {
    if (_lampState) {
      _showonDialog(context);
    } else {
      _onDialog(context);
    }
    setState(() {});
  }

  _showonDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 켜진 상태입니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('네, 알겠습니다.'),
              ),
            )
          ],
        );
      },
    );
  }

  _onDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('램프 켜기'),
          content: const Text('램프를 켜시겠습니까?'),
          actions: [
            ElevatedButton(onPressed: () => {
                Navigator.of(context).pop(),
                setLampState(),
              }, child: Text('네')
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );
  }
  _offDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 꺼진 상태입니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('네, 알겠습니다.'),
              ),
            )
          ],
        );
      },
    );
  }
  _showoffDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('램프 끄기'),
          content: const Text('램프를 끄시겠습니까?'),
          actions: [
            ElevatedButton(onPressed: () => {
                Navigator.of(context).pop(),
                setLampState(),
              }, child: Text('네')
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );
  }
}
