// ignore_for_file: prefer_const_constructors
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'receivedmail.dart';
import 'sendmail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator_AppBar'),
        backgroundColor: Colors.blue,
        actions:[
          IconButton(
            onPressed: ()  => gosendpage(context),
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: ()  => gorepage(context),
            icon: Icon(Icons.email_outlined),),
        ]
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => gosendpage(context), 
              child: Text('보낸메일함'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                  ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                ),
              ),

            ElevatedButton(
              onPressed: () => gorepage(context), 
              child: Text('받은메일함'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar( 
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('Pikachu@naver.com'),
              decoration:BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
            ),
          ),
            ),
            ListTile(
              leading: Icon(
                Icons.mail_sharp
                ),
              title: Text('보낸메일함'),
              //onPressed: () => gosendpage(context),
              onTap: () => Navigator.pushNamed(context, '/send'),
            ),
            
            ListTile(
              leading: Icon(
                Icons.mail_outline
              ),
              title: Text('받은메일함'),
            ),

          ],
        )
      )  
    );
  }


//-----function------
gosendpage(context){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context){
        return SendMail();
      }
    ),
  );  
}
gorepage(context){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context){
        return ReceivedMail();
      }
    ),
  );
}
}