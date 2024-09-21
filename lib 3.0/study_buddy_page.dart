import 'package:flutter/material.dart';

class StudyBuddyPage extends StatelessWidget {
  const StudyBuddyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Buddy Options'),
      ),
      body: const Center(
        child: Text('Study Buddy Content'),
      ),
    );
  }
}