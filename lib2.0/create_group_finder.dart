import 'package:flutter/material.dart';
import 'global_state.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final _formKey = GlobalKey<FormState>();
  String groupTopic = '';
  String? batchRequisites; // Optional field
  int numOfMembers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Study Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Group Topic'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a group topic';
                  }
                  return null;
                },
                onSaved: (value) {
                  groupTopic = value!;
                },
              ),
              SizedBox(height: 20),

              // Optional Batch Requisites field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Batch Requisites (Optional)',
                ),
                onSaved: (value) {
                  batchRequisites = value; // Can be null if not provided
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Members'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of members';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  numOfMembers = int.parse(value!);
                },
              ),
              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle group creation logic here
                      print('Group Created: Topic: $groupTopic, Batch: $batchRequisites, Members: $numOfMembers');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Group Created Successfully')),
                      );
                    }
                  },
                  child: Text('Create Group'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
