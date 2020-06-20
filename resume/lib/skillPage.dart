import 'package:flutter/material.dart';

class SkillPage extends StatelessWidget {
  List<String> skills = [
    'Web Development \n(ReactJS, Redux, HTML, CSS, Javascript)',
    'Back End Development \n(Java and Go)',
    'Linux Environment',
    'Relational Database \n(PostgreSQL, Oracle RDBMS)',
    'Non Relational Database \n(Redis, MongoDB)',
    'Development Tools \n(Docker, Jenkins, Git)',
    'Message Queues \n(NSQ, Google Pub/Sub)',
    'Microservices \n(with REST API and gRPC)',
    'Mobile App Development \n(using Flutter)'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Skill'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.laptop),
              title: Text(skills[index], style: TextStyle(fontSize: 15.0),),
            ),
          );
        },
      )
    );
  }
}
