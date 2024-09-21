class Group { // New field for group time

  Group({
    required this.groupTopic,
    this.batchRequisites,
    required this.numOfMembers,
    required this.time, // Include time in constructor
  });
  String groupTopic;
  String? batchRequisites;
  int numOfMembers;
  String time;
}
