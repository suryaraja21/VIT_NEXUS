import 'package:flutter/material.dart';

class ProvideSolutionPage extends StatelessWidget {
  final List<String> questions; // Accept a list of questions

  ProvideSolutionPage({required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provide Solutions to Other\'s Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    questions[index],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}