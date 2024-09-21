import 'package:flutter/material.dart';
import 'global_state.dart';
import 'tutor_bridge_page.dart';  // Import global state

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
        globalQuestions.add(_controller.text); // Add the question to globalQuestions
        _controller.clear(); // Clear the input field
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              itemCount: globalQuestions.length,
              reverse: true, // Latest message at the bottom
              itemBuilder: (BuildContext context, int index) {
                final String message = globalQuestions[globalQuestions.length - 1 - index];
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
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
                const SizedBox(width: 8),
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
