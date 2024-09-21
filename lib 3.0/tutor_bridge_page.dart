import 'package:flutter/material.dart';
import 'question_corner_page.dart'; // Import the Question Corner page
import 'provide_solution_page.dart'; // Import the Provide Solution page

// Declare global list to hold the questions
List<String> globalQuestions = <String>[];

class TutorBridgePage extends StatelessWidget {
  const TutorBridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Bridge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Question Corner page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => QuestionCornerPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, buttonHeight),
              ),
              child: Text(
                'Question Corner',
                style: TextStyle(fontSize: 35),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to Provide Solutions page and pass the globalQuestions list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProvideSolutionPage(questions: globalQuestions),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, buttonHeight),
              ),
              child: Text(
                'Provide Solutions to Other\'s Problem',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}