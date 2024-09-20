import 'package:flutter/material.dart';
import 'create_group_finder.dart';
import 'join_group_finder.dart';
class StudyGroupFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Group Finder Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Create Group Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateGroupPage(),
                  ),
                );
              },
              child: Text(
                'Create a Group',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Button width and height
              ),
            ),
            SizedBox(height: 30), // Spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Join Group Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JoinGroupPage(),
                  ),
                );
              },
              child: Text(
                'Join a Group',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Button width and height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
