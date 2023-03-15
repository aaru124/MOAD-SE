import 'package:flutter/material.dart';

class Application {
  final String name;
  final String description;
 

  Application(
      {required this.name, required this.description, });
}

final applications = [
  Application(
      name: 'Application 1',
      description: 'This is the first application',
      ),
  Application(
      name: 'Application 2',
      description: 'This is the second application',
      ),
  Application(
      name: 'Application 3',
      description: 'This is the third application',
      ),
];

class LeaveApplicationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Applications"),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.edit_document),
            title: Text(applications[index].name),
            subtitle: Text(applications[index].description),
            trailing: ElevatedButton(
              child: Text("Accept"),
              onPressed: () {
                // TODO: Implement acceptance functionality
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApplicationDetails(
                    name: applications[index].name,
                    description: applications[index].description,
                    
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ApplicationDetails extends StatelessWidget {
  final String name;
  final String description;
 

  ApplicationDetails(
      {required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.edit_document),
          SizedBox(height: 16.0),
          Text(description),
        ],
      ),
    );
  }
}
