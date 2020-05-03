import 'package:flutter/material.dart';

void main() => runApp(HelloWhoApp());

class HelloWhoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Hello Who App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.greenAccent
      ),
      home: Home()
      // home: new Scaffold(
      //   backgroundColor: Colors.blueAccent,
      //   body:(
      //     Center(
      //       child: Text(
      //         'Hello World 3!', 
      //         textDirection: TextDirection.ltr,
      //         style: TextStyle(color: Colors.white),
      //       )
      //     )
      //   )
      // ),
    );
  }
}

class Home extends StatefulWidget{
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  String name = '';
  String greetingMessage = '';

  void onPressed (){
    setState(() {
      if(this.name.trim().length ==0){
        return;
      }else{
        this.greetingMessage = 'Hello ' + this.name + ', it\'s nice to see you.';
      }  
    });
  }

  void onNameChanged(String newNameValue){
    setState(() {
      this.name = newNameValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Who App')
      ),
      body: Center(
              child: Column(
              children: <Widget>[
                Text('Enter your name below and click Greet!'),
                TextField(
                  onChanged: (String newValue){onNameChanged(newValue);}
                ),
                RaisedButton(
                  child: Text('Greet'),
                  onPressed: () {onPressed();},
                ),
                Container(height: 15.0),
                Text(this.greetingMessage)
              ],
          )
        )
    );
  }

  

}


// class HelloWhoApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child: Text(
//         'Hello World 2!', 
//         textDirection: TextDirection.ltr
//         )
//       );
//   }
// }


// void main(){
//   runApp(
//     Center(
//       child: Text(
//         'Hello World!',
//         textDirection: TextDirection.ltr,
//         ),
//       )
//   );
// }