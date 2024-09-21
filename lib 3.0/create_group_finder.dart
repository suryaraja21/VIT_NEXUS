import 'package:flutter/material.dart';
import 'group_model.dart';  // Adjust the path as necessary
import 'global_state.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String groupTopic = '';
  String? batchRequisites;
  int numOfMembers = 0;
  String time = ''; // New field for time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Study Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Group Topic'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a group topic';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  groupTopic = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Batch Requisites (Optional)'),
                onSaved: (String? value) {
                  batchRequisites = value;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Number of Members'),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of members';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  numOfMembers = int.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Time'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  time = value!;
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      for (Group group in groups) {
                        if (group.time == time) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Already registered for a group at this time')),
                          );
                          return; // Prevent further execution
                        }
                      }

                      // Add the new group to the global list of groups
                      groups.add(Group(
                        groupTopic: groupTopic,
                        batchRequisites: batchRequisites,
                        numOfMembers: numOfMembers,
                        time: time,
                      ));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Group Created Successfully')),
                      );

                      Navigator.pop(context); // Go back after creation
                    }
                  },
                  child: const Text('Create Group'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
