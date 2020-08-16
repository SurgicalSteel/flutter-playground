import 'package:flutter/material.dart';

class HowToPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('How To Use Zlatan Quote'),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Click the Refresh button to explore all the quotes from the great Zlatan Ibrahimovic",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
