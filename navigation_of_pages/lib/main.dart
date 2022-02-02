// BT19CSE047 NEHA KALBANDE
// ITW2 ASSIGNMENT 3

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation_To_Pages',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      primaryColor: Colors.deepOrangeAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),
      '/second': (context) => SecondPage(),
      '/third': (context) => ThirdPage(),
    },
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation To Pages'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Second Page'),
              color: Colors.tealAccent[400],
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            SizedBox(width: 15),
            RaisedButton(
              child: Text('Third Page'),
              color: Colors.tealAccent[400],
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.tealAccent[400],
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back to First Page!'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.tealAccent[400],
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back to First Page!'),
        ),
      ),
    );
  }
}
