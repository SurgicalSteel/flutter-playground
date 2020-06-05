	import 'package:flutter/material.dart';
 
class EducationPage extends StatelessWidget {
  
  /** only if you want to add parameter to this page */
  //final String parameter;
  //EducationPage(this.parameter);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Education'),
        centerTitle: true,
      ),
    );
  }
}