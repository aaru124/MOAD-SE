import 'package:flutter/material.dart';

class Application {
  final String name;
  final String description;
  final String imageUrl;

  Application(
      {required this.name, required this.description, required this.imageUrl});
}

final applications = [
  Application(
      name: 'Application 1',
      description: 'This is the first application',
      imageUrl: 'https://via.placeholder.com/150'),
  Application(
      name: 'Application 2',
      description: 'This is the second application',
      imageUrl: 'https://via.placeholder.com/150'),
  Application(
      name: 'Application 3',
      description: 'This is the third application',
      imageUrl: 'https://via.placeholder.com/150'),
];

class TrainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Train Concession Applications"),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(applications[index].imageUrl),
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
                    imageUrl: applications[index].imageUrl,
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
  final String imageUrl;

  ApplicationDetails(
      {required this.name, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 16.0),
          Text(description),
        ],
      ),
    );
  }
}
