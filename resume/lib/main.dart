import 'package:flutter/material.dart';
import 'sidebarDrawer.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Yuwono Bangun Nagoro'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final String description = '''A full-stack software engineer who has passion in developing innovative software with 4 years of work experience in Indonesian start-up companies. Loves to learn new technologies and to do experiments in software development using Golang. Has big passion to contribute in open source software.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
        ),
        centerTitle: true,
      ),
      drawer: getSidebarDrawer(context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0277BD),Color(0xFFB3E5FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
            ),
          ),
          Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Card(
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)
                            ),
                            image: DecorationImage(
                              image : NetworkImage("https://aboutme.imgix.net/background/users/y/u/w/yuwonobangunnagoro_1575036403_652.jpg"),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 50 + MediaQuery.of(context).size.height * 0.3, 20, 50),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Text(
                                  this.description, 
                                  softWrap: true,
                                  textAlign:TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15.0, 
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.w400, 
                                    decoration: TextDecoration.none
                                  ),
                                )                              
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 50 + MediaQuery.of(context).size.height * 0.6, 20, 50),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Text(
                                  'Click Menu to Explore',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0, 
                                    fontFamily: 'SegoeUI', 
                                    fontWeight: FontWeight.w400, 
                                    decoration: TextDecoration.none
                                  ),
                                )
                        ) 

                      ],
                    ),
                ),
              ),
          )
        ],
      ),
    );
  }
}
