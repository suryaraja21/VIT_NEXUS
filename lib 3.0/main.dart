import 'package:flutter/material.dart';
import 'tutor_bridge_page.dart';
import 'study_group_finder_page.dart';
import 'collaborative_project_management_page.dart';
import 'study_buddy_page.dart';
import 'settings_page.dart';
import 'contact_page.dart'; // Import the contact page
import 'about_us_page.dart'; // Import the about us page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'castellar',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 10),
            Text('Username1'),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage(),
                  ),
                );
              } else if (value == 'Contact') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage(),
                  ),
                );
              } else if (value == 'About Us') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutUsPage(),
                  ),
                );
              }
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return <String>{'Settings', 'Contact', 'About Us'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 450),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => TutorBridgePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Tutor Bridge',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 450),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => StudyGroupFinderPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Study Group Finder',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 450),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => CollaborativeProjectManagementPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Collaborative Project Management',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 450),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => StudyBuddyPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Study Buddy',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () {
                  print('Logout tapped');
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
