import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('material3 Design'),
      ),
      body: Center(
        child:Column(
          children: [
            Container(
              height:50,
              color: Theme.of(context).colorScheme.primary,
              alignment: Alignment(0.0,0.0),
              child: Text('Primarty Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary),),  //프라이머리 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment(0.0,0.0),
              child: Text('Secondary Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary),),  //두번째 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.tertiary,
              alignment: Alignment(0.0,0.0),
              child: Text('Thard Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary),),  //세번째 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.error,
              alignment: Alignment(0.0,0.0),
              child: Text('error Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,),),//에러 칼라 보색 활용
            ),
//========================================================================
            Container(
              height:50,
              color: Theme.of(context).colorScheme.primaryContainer,
              alignment: Alignment(0.0,0.0),
              child: Text('PrimartyContainer Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),),  //프라이머리 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.secondaryContainer,
              alignment: Alignment(0.0,0.0),
              child: Text('SecondaryContainer Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer),),  //두번째 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              alignment: Alignment(0.0,0.0),
              child: Text('ThardContainer Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer),),  //세번째 칼라 보색 활용
            ),
            Container(
              height:50,
              color: Theme.of(context).colorScheme.errorContainer,
              alignment: Alignment(0.0,0.0),
              child: Text('errorContainer Color',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer),),//에러 칼라 보색 활용
            ),
          ],
        )
      )
    );
  }
}