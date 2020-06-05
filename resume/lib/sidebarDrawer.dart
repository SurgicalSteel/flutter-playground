import 'package:flutter/material.dart';
import 'educationPage.dart';
import 'experiencePage.dart';
import 'skillPage.dart';
import 'osProjectPage.dart';
import 'miscellaneousPage.dart';
import 'myLinksPage.dart';
import 'contactMePage.dart';

Drawer getSidebarDrawer(BuildContext context){
  return new Drawer(
    child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Yuwono Bangun Nagoro'),
              accountEmail: Text('bangunnagoro@outlook.com'),
            ),
            ListTile(
              title: Text("Skill"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SkillPage()))
              },
            ),
            ListTile(
              title: Text("Experience"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ExperiencePage()))
              },
            ),
            ListTile(
              title: Text("Education"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => EducationPage()))
              },
            ),
            ListTile(
              title: Text("Open Source Projects"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => OSProjectPage()))
              },
            ),
            ListTile(
              title: Text("Misc"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MiscellaneousPage()))
              },
            ),
            ListTile(
              title: Text("My Links"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyLinksPage()))
              },
            ),
            ListTile(
              title: Text("Contact Me"),
              onTap: () => {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ContactMePage()))
              },
            ),
          
          ]  
    )
  );
}