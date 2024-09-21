import 'package:flutter/material.dart';
import 'tutor_bridge_page.dart'; // Import the globalQuestions list

class QuestionCornerPage extends StatefulWidget {
  const QuestionCornerPage({super.key});

  @override
  _QuestionCornerPageState createState() => _QuestionCornerPageState();
}

class _QuestionCornerPageState extends State<QuestionCornerPage> {
  final TextEditingController _controller = TextEditingController();

  void _submitQuestion() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Add the typed question to the global list
        globalQuestions.add(_controller.text);
        _controller.clear(); // Clear the text field after submission
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Corner'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          // Expanded ListView to display the list of questions like chat bubbles
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              itemCount: globalQuestions.length,
              reverse: true, // Display the most recent message at the bottom
              itemBuilder: (BuildContext context, int index) {
                final String message = globalQuestions[globalQuestions.length - 1 - index];
                return Align(
                  alignment: Alignment.centerRight, // All messages from the user
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100], // Chat bubble color
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                // Expanded Text Field to take up most of the row
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Type your question...',
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between the text field and the button
                // Circular button to act as the "Send" bubble
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _submitQuestion,
                    icon: const Icon(Icons.send, color: Colors.white),
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
