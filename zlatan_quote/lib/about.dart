import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About Zlatan Quote'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Zlatan Quote provides quotes from the great Zlatan Ibrahimovic to boost your confidence level.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "It's time to explore all of the quotes from the football god in this simple app.\nUnleash your inner Zlatan!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Developed by Yuwono Bangun Nagoro (a.k.a SurgicalSteel) using Flutter.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
