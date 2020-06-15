import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 
class ContactMePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contact Me'),
        centerTitle: true,
      ),
      body: ContactForm(),
    );
  }  
}

class ContactForm extends StatefulWidget{
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
    
}

class ContactFormState extends State<ContactForm>{
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  sendMessage() async{
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Sending message...')
        )
        );
    }

    final String _email = 'mailto:bangunnagoro@outlook.com'+
        '?subject=' +
        _subjectController.text +
        '&body=' +
        _messageController.text;
    try {
      await launch(_email);
    } catch (e) {
      print(e.toString());
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message.')
        )
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(height: 20.0,),
          Text(
                'Let\'s connect and share some ideas', 
                softWrap: true,
                textAlign:TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.0, 
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w400, 
                  decoration: TextDecoration.none
                ),
              ),
          Container(height: 20.0,),
          TextFormField(
            controller: _subjectController,
            decoration: InputDecoration(
              border:OutlineInputBorder(),
              hintText: 'Subject', 
              labelText: 'Subject'
            ),
            keyboardType: TextInputType.text,
            validator: (value){
              if(value.isEmpty){
                return 'Subject cannot be blank.';
              }
              return null;
            },
          ),
          Container(height: 20.0,),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              border:OutlineInputBorder(),
              hintText: 'Message',
              labelText: 'Message'),
            keyboardType: TextInputType.multiline,
            validator: (value){
              if(value.isEmpty){
                return 'Message cannot be blank.';
              }
              return null;
            },
            maxLines: null,
          ),
          Container(height: 20.0,),
          RaisedButton(
            child: Text('Send Message'),
            onPressed: sendMessage
          )
        ],
      ),
    );
  }

}