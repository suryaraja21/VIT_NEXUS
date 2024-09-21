import 'package:flutter/material.dart';
import 'save_group_data.dart';  // Import your group model and global list
import 'group_model.dart';
import 'global_state.dart';
class JoinGroupPage extends StatelessWidget {
  const JoinGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join a Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: groups.length,  // Use the global groups list
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      groups[index].groupTopic,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Batch Requisites: ${groups[index].batchRequisites ?? 'None'}'),
                    const SizedBox(height: 8),
                    Text('Number of Members: ${groups[index].numOfMembers}'),
                    const SizedBox(height: 8),
                    Text('Time: ${groups[index].time}'), // Display the time
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the join group logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Joined ${groups[index].groupTopic}')),
                        );
                      },
                      child: const Text('Join Group'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
