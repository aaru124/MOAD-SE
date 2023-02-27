import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              title: Text("Notifications"),
            ),
            SwitchListTile(
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
              title: Text("Dark Mode"),
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Support"),
              onTap: () {},
            ),
            
          ],
        ),
      ),
    );
  }
}
