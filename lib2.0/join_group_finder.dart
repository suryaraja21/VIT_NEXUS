import 'package:flutter/material.dart';
import 'global_state.dart'; // Import the global state

class JoinGroupPage extends StatefulWidget {
  @override
  _JoinGroupPageState createState() => _JoinGroupPageState();
}

class _JoinGroupPageState extends State<JoinGroupPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the groups based on the search query
    final filteredGroups = groups.where((group) {
      return group.groupTopic.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Study Group'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Group Topic',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredGroups.length,
        itemBuilder: (context, index) {
          final group = filteredGroups[index];
          return ListTile(
            title: Text(group.groupTopic),
            subtitle: Text('Members: ${group.numOfMembers}'),
            onTap: () {
              // Handle joining the group here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Joined group: ${group.groupTopic}')),
              );
            },
          );
        },
      ),
    );
  }
}
