import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExperienceCompanyItem{
  String companyName;
  String companyDescription;
  DateTime startDate;
  DateTime endDate;
  String position;
  String team;
  String location;
  List<String> projects;

  ExperienceCompanyItem(this.companyName, this.companyDescription, this.startDate, this.endDate, this.position, this.team, this.location, this.projects);
}

class ExperiencePage extends StatelessWidget {
  List<ExperienceCompanyItem> experienceCompanyItems = getExperienceCompanyItems();

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Experience'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount : experienceCompanyItems.length, 
        itemBuilder: (context,index){
          ExperienceCompanyItem item = experienceCompanyItems[index];
          return Card(
                  child: ListTile(
                    //isThreeLine: true,
                    leading: Icon(Icons.business_center),
                    title: Text(
                      item.companyName+ "\n"+
                      //item.companyDescription+ "\n"+
                      //DateTime. item.startDate.toString() + " - "+ item.endDate.toString() + "\n"+  
                      constructDateFormat(item.startDate) + " - " + constructDateFormat(item.endDate) + "\n"+
                      item.position + "\n"+ 
                      item.team +" team"),
                    //   Text(item.companyName),
                    //   Text(item.startDate.toString())
                    // ],
                  )
                );
        }
      ),
    );
  }
}


// private functions
List<ExperienceCompanyItem> getExperienceCompanyItems(){
  List<ExperienceCompanyItem> experienceCompanyItems = new List();

  experienceCompanyItems.add(
    ExperienceCompanyItem(
      'PT Telekomunikasi Selular (Telkomsel)',
      'Telkomsel is the largest Indonesian wireless network provider with more than 170 millions active customer.',
      DateTime(2014,6,1),
      DateTime(2014,8,31),
      'Software Engineer Intern',
      'Regulatory Reporting',
      'Jakarta, Indonesia',
      [
        'bla bla bla',
        'bla bla bla'
      ]
    ) 
  );

  experienceCompanyItems.add(
    ExperienceCompanyItem(
      'PT Tokopedia (www.tokopedia.com)',
      'Tokopedia is the largest Indonesian online marketplace start-up.',
      DateTime(2016,8,1),
      DateTime(2018,6,22),
      'Software Engineer',
      'Transaction (Order and Checkout)',
      'Jakarta, Indonesia',
      [
        'bla bla bla',
        'bla bla bla'
      ]
    )
  );

  experienceCompanyItems.add(
    ExperienceCompanyItem(
      'PT Airy Nest Indonesia (www.airy.com)',
      'Airy is an Accommodation Network Orchestrator (ANO) in partnership with a variety of the best budget hotels throughout Indonesia.',
      DateTime(2018,6,25),
      DateTime(2020,4,30),
      'Software Engineer',
      'Marketing Technology',
      'Jakarta, Indonesia',
      [
        'bla bla bla',
        'bla bla bla'
      ]
    )
  );

  experienceCompanyItems.sort( (a,b) => b.startDate.compareTo(a.startDate) );
  
  return experienceCompanyItems;
}

String constructDateFormat(DateTime dateTime){
  var formatter = new DateFormat("dd MMMM yyyy");
  String formatted = formatter.format(dateTime);
  return formatted;
}