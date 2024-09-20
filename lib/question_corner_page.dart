import 'package:flutter/material.dart';
import 'tutor_bridge_page.dart'; // Import the globalQuestions list

class QuestionCornerPage extends StatefulWidget {
  @override
  _QuestionCornerPageState createState() => _QuestionCornerPageState();
}

class _QuestionCornerPageState extends State<QuestionCornerPage> {
  final TextEditingController _controller = TextEditingController();

  void _submitQuestion() {
    setState(() {
      // Add the typed question to the global list
      globalQuestions.add(_controller.text);
      _controller.clear(); // Clear the text field after submission
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Corner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Expanded Text Field to take up most of the row
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your question here',
                    ),
                  ),
                ),
                SizedBox(width: 8), // Space between the text field and the button
                // Small circular button to act as the "Send" bubble
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _submitQuestion,
                    icon: Icon(Icons.send, color: Colors.white),
                    tooltip: 'Send',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}