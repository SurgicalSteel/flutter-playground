import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLinksPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Links'),
        centerTitle: true,
      ),
      body: LinkCollection()
      
    );
  }
}

class LinkCollection extends StatefulWidget{
  @override
  LinkCollectionState createState() {
    return LinkCollectionState();
  }
    
}

class LinkCollectionState extends State<LinkCollection>{
  launchURL(String url) async{
    try {
      await launch(url);
    } catch (e) {
      print(e.toString());
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open URL.')
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          
            alignment: Alignment(0.0, 0.0),
            margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 300.0,
                    height: 75.0,
                    child:
                      RaisedButton(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                        onPressed: () {launchURL("https://www.about.me/YuwonoBangunNagoro");},
                        child: Text(
                          "My Page",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          )
                        ),
                      )
                  ),
                  Container(height: 25,),
                  ButtonTheme(
                    minWidth: 300.0,
                    height: 75.0,
                    child:
                      RaisedButton(
                        color: Colors.blue,
                        shape: StadiumBorder(),
                        onPressed: () {launchURL("https://www.linkedin.com/in/bangunnagoro");},
                        child: Text(
                          "LinkedIn",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          )
                        ),
                      )
                  ),
                  Container(height: 25,),
                  ButtonTheme(
                    minWidth: 300.0,
                    height: 75.0,
                    child:
                      RaisedButton(
                        color: Colors.black,
                        shape: StadiumBorder(),
                        onPressed: () {launchURL("https://www.github.com/SurgicalSteel");},
                        child: Text(
                          "GitHub",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          )
                        ),
                      )
                  ),
                ]
              ),
        );
  }

}